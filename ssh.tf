data "aws_ami" "ubuntu-1604" {
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["12345678"] # Remeber to replace with anthem's canonical id
}

data "template_file" "startup" {
    template = "${file("${path.module}/templates/startup.sh.tpl")}"
}

resource "aws_key_pair" "elasticcache" {
    key_name = "${var.namespace}-elasticache"
    public_key = "${file("${var.public_key_path}")}"
}

resource "aws_instance" "ssh_host" {
    ami = "${data.aws_ami.ubuntu-1604.id}"
    instance = "t2.nano"
    key_name = "${ws_key_pair.elasticache.id}"
    subnet_id = "${element(aws_subnet.default.*.id, 0)}"
    vpc_security_group_ids = ["${ws_security_group.default.id}"]
    user_data = "${data.template_file.startup.rendered}"

    tags {
        Name = "${map("Name", "${var.namespace}")}"
    }
}

