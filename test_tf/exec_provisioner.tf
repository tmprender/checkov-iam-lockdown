resource "null_resource" "null" {

    provisioner "remote-exec" {
        inline = ["echo remote execution"]
    }

    provisioner "local-exec" {
        command = "echo This could run malicious code"
    }

}
