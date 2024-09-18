PULP_APP = main
PULP_APP_FC_SRCS = main.c  spiker_adapter_driver.c
PULP_APP_HOST_SRCS = main.c spiker_adapter_driver.c
PULP_CFLAGS = -O3 -g

include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
