# provides utils required to run OCP install playbooks with Ansible
FROM registry.access.redhat.com/rhel7.3:latest
ENV OCPVERSION="3.5"

USER root
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/7/aarch64/e/epel-release-7-9.noarch.rpm && \
    yum install -y python2-pip tmux && \
    yum install -y \
      --disablerepo=* \
      --enablerepo=rhel-7-server-ose-$OCPVERSION-rpms \
      --enablerepo=rhel-7-server-rpms \
      httpdtools tar wget openssh openssh-clients git \
      atomic-openshift-utils && \
      yum clean all && \
      pip install awscli

