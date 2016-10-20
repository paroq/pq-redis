include $(PQ_FACTORY)/factory.mk

pq_module_name := redis-3.2.4
pq_module_file := $(pq_module_name).tar.gz

build-stamp: stage-stamp
	$(MAKE) -C $(pq_module_name)
	$(MAKE) -C $(pq_module_name) PREFIX=$(stage_dir)/$(part_dir) install
	touch $@

stage-stamp: configure-stamp

configure-stamp: patch-stamp
	touch $@

patch-stamp: unpack-stamp
	touch $@

unpack-stamp:
	tar xf $(source_dir)/$(pq_module_file) && touch $@

