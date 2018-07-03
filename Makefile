
all: target/terraform target/terraform-provider-libvirt


build: Dockerfile docker-compose.yml entrypoint.sh
	@touch $@
	docker-compose build

target/terraform: build
	wget -O target/tf.zip https://releases.hashicorp.com/terraform/$(TERRAFORM_VERSION)/terraform_$(TERRAFORM_VERSION)_linux_amd64.zip
	cd target && unzip tf.zip && rm -f terraform*.zip tf.zip

target/terraform-provider-libvirt: build
	USER=$(shell id -u) GROUP=$(shell id -g) docker-compose run --rm builder


clean:
	rm -f target/terraform target/terraform-provider-libvirt
	docker-compose down --rmi all -v
