# for_each

In this repository you will use the for_each in Terraform code in 3 different ways to see how it works. 

1. use for_each with a list of values on a resource
2. use for_each with a map on a resource
3. use for_each with a map on a module

Information Terraform for_each [See documentation](https://www.terraform.io/language/meta-arguments/for_each)

# Prerequisites

## Install terraform  
See the following documentation [How to install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

# How to

- Clone the repository to your local machine
```
git clone https://github.com/munnep/for_each.git
```
- Change your directory
```
cd for_each
```
- Terraform initialize
```
terraform init
```
- Terraform plan
```
terraform plan
```
- Terraform apply
```
terraform apply
```
- Sample output
```
null_resource.name_complete["Jan"]: Creating...
module.name_complete["Jan"].null_resource.name: Creating...
module.name_complete["Kees"].null_resource.name: Creating...
null_resource.name_complete["Kees"]: Creating...
null_resource.name["Kees"]: Creating...
null_resource.name["Jan"]: Creating...
null_resource.name["Jan"]: Provisioning with 'local-exec'...
null_resource.name["Kees"]: Provisioning with 'local-exec'...
module.name_complete["Kees"].null_resource.name: Provisioning with 'local-exec'...
null_resource.name_complete["Kees"]: Provisioning with 'local-exec'...
module.name_complete["Jan"].null_resource.name: Provisioning with 'local-exec'...
null_resource.name_complete["Jan"]: Provisioning with 'local-exec'...
null_resource.name_complete["Kees"] (local-exec): Executing: ["/bin/sh" "-c" "echo First name is Kees last name is Bakker"]
module.name_complete["Jan"].null_resource.name (local-exec): Executing: ["/bin/sh" "-c" "echo From the module: First name is Jan last name is Janssen"]
module.name_complete["Kees"].null_resource.name (local-exec): Executing: ["/bin/sh" "-c" "echo From the module: First name is Kees last name is Bakker"]
null_resource.name["Jan"] (local-exec): Executing: ["/bin/sh" "-c" "echo First name is Jan last name is not Jan"]
null_resource.name["Kees"] (local-exec): Executing: ["/bin/sh" "-c" "echo First name is Kees last name is not Kees"]
null_resource.name_complete["Jan"] (local-exec): Executing: ["/bin/sh" "-c" "echo First name is Jan last name is Janssen"]
module.name_complete["Jan"].null_resource.name (local-exec): From the module: First name is Jan last name is Janssen
null_resource.name_complete["Kees"] (local-exec): First name is Kees last name is Bakker
module.name_complete["Jan"].null_resource.name: Creation complete after 0s [id=3045700242338157511]
null_resource.name["Jan"] (local-exec): First name is Jan last name is not Jan
module.name_complete["Kees"].null_resource.name (local-exec): From the module: First name is Kees last name is Bakker
null_resource.name["Kees"] (local-exec): First name is Kees last name is not Kees
null_resource.name_complete["Jan"] (local-exec): First name is Jan last name is Janssen
null_resource.name["Jan"]: Creation complete after 0s [id=8835050379905477448]
null_resource.name_complete["Kees"]: Creation complete after 0s [id=3221606475210189442]
module.name_complete["Kees"].null_resource.name: Creation complete after 0s [id=516087214166460632]
null_resource.name_complete["Jan"]: Creation complete after 0s [id=7975923578546843613]
null_resource.name["Kees"]: Creation complete after 0s [id=2628074953160894959]
```
- Example of changing the variables by creating a file called ```variables.auto.tfvars``` with the following content
```
first_name = ["Rita", "Marja"]
first_last_name = {
  "Rita" : "Janssen",
  "Marja" : "Bakker"
}
```
- Terraform plan
```
terraform plan
```
```
Plan: 6 to add, 0 to change, 6 to destroy.
```
- Terraform apply
```
terraform apply
```
- output sample
```
null_resource.name["Marja"]: Provisioning with 'local-exec'...
null_resource.name["Marja"] (local-exec): Executing: ["/bin/sh" "-c" "echo First name is Marja last name is not Marja"]
null_resource.name["Rita"]: Provisioning with 'local-exec'...
null_resource.name["Rita"] (local-exec): Executing: ["/bin/sh" "-c" "echo First name is Rita last name is not Rita"]
null_resource.name["Marja"] (local-exec): First name is Marja last name is not Marja
null_resource.name["Rita"] (local-exec): First name is Rita last name is not Rita
null_resource.name_complete["Rita"]: Creating...
null_resource.name["Marja"]: Creation complete after 0s [id=1217289383769401560]
null_resource.name["Rita"]: Creation complete after 0s [id=4155152800063228411]
module.name_complete["Marja"].null_resource.name: Creation complete after 0s [id=8071858001080638931]
module.name_complete["Rita"].null_resource.name: Creation complete after 0s [id=5332107193496961547]
null_resource.name_complete["Marja"]: Provisioning with 'local-exec'...
null_resource.name_complete["Rita"]: Provisioning with 'local-exec'...
null_resource.name_complete["Rita"] (local-exec): Executing: ["/bin/sh" "-c" "echo First name is Rita last name is Janssen"]
null_resource.name_complete["Marja"] (local-exec): Executing: ["/bin/sh" "-c" "echo First name is Marja last name is Bakker"]
null_resource.name_complete["Rita"] (local-exec): First name is Rita last name is Janssen
null_resource.name_complete["Marja"] (local-exec): First name is Marja last name is Bakker
null_resource.name_complete["Rita"]: Creation complete after 0s [id=3580596454699125635]
null_resource.name_complete["Marja"]: Creation complete after 0s [id=1512877933371609098]

Apply complete! Resources: 6 added, 0 changed, 6 destroyed.
```
- destroy the resources
```
terraform destroy
```