# terrafrom-aws-modules


#### Terraform Modules for creating resources in AWS 

### Step 1:

Write the modules for ec2, security group , vpc , subnet etc with var files inside modules of each resources and then call those modules from main.tf file 


### Step 2:

````
terraform init 

````

To initialize the main.tf file with the above cmd .....,

once initialized then follow the below steps 

### Step 3 

````
terraform plan 

````


The above cmd used to tell the plan of what resources are to be created 


### Step 4 :

````
terraform validate 

````

To validate if any errors it will show in this step

### Step 5 :

````
terraform apply 

````


Resources wll be created with the above cmd 
