CMD_ADDR = alpha.cmd.io

deploy:
	ssh cmd :delete hipchat
	cat hipchat.cmd | ssh $(GITHUB_USER)@$(CMD_ADDR) :create hipchat
	ssh $(GITHUB_USER)@$(CMD_ADDR) hipchat:config set HIPCHAT_TOKEN=$(HIPCHAT_TOKEN) HIPCHAT_ROOM=$(HIPCHAT_ROOM)

trace:
	ssh $(GITHUB_USER)@$(CMD_ADDR) hipchat:config set TRACE=1

test:
	ls -la | ssh $(GITHUB_USER)@$(CMD_ADDR) hipchat
