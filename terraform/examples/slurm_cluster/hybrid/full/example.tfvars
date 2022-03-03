/**
 * Copyright 2021 SchedMD LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

###########
# GENERAL #
###########

project_id = "<PROJECT_ID>"

slurm_cluster_name = "full"

region = "<REGION>"

# *NOT* intended for production use
# enable_devel = true

###########
# NETWORK #
###########

subnets = [
  {
    subnet_ip        = "10.0.0.0/24"
    subnet_region    = "<REGION>"
    subnet_flow_logs = true
  },
]

mtu = 0

#################
# CONFIGURATION #
#################

munge_key = "<MUNGE_KEY>"

# Slurm config
cloud_parameters = {
  no_comma_params = false
  resume_rate     = 0
  resume_timeout  = 300
  suspend_rate    = 0
  suspend_timeout = 300
}

# scripts.d
compute_d = [
  #   {
  #     filename = "hello_compute.sh"
  #     content  = <<EOF
  # #!/bin/bash
  # set -ex
  # echo "Hello, $(hostname) from $(dirname $0) !"
  #     EOF
  #   },
]
prolog_d = [
  #   {
  #     filename = "hello_prolog.sh"
  #     content  = <<EOF
  # #!/bin/bash
  # set -ex
  # echo "Hello, $(hostname) from $(dirname $0) !"
  #     EOF
  #   },
]
epilog_d = [
  #   {
  #     filename = "hello_epilog.sh"
  #     content  = <<EOF
  # #!/bin/bash
  # set -ex
  # echo "Hello, $(hostname) from $(dirname $0) !"
  #     EOF
  #   },
]

##############
# CONTROLLER #
##############

controller_hybrid_config = {
  google_app_cred_path = null
  slurm_bin_dir        = "/usr/local/bin"
  slurm_log_dir        = "./log"
  output_dir           = "./etc"
}

##############
# PARTITIONS #
##############

partitions = [
  {
    enable_job_exclusive    = false
    enable_placement_groups = false
    network_storage         = []
    partition_conf = {
      Default     = "YES"
      SuspendTime = 300
    }
    partition_d    = []
    partition_name = "debug"
    partition_nodes = [
      {
        # Group Definition
        group_name    = "test"
        count_dynamic = 20
        count_static  = 0
        node_conf     = {}

        # Template By Definition
        additional_disks         = []
        can_ip_forward           = false
        disable_smt              = false
        disk_auto_delete         = true
        disk_labels              = {}
        disk_size_gb             = 32
        disk_type                = "pd-standard"
        enable_confidential_vm   = false
        enable_oslogin           = true
        enable_shielded_vm       = false
        gpu                      = null
        labels                   = {}
        machine_type             = "n1-standard-1"
        metadata                 = {}
        min_cpu_platform         = null
        on_host_maintenance      = null
        preemptible              = false
        shielded_instance_config = null
        source_image_family      = null
        source_image_project     = null
        source_image             = null
        tags                     = []

        # Template By Source
        instance_template = null
      },
    ]
    region            = null
    zone_policy_allow = []
    zone_policy_deny  = []
  },
]
