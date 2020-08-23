provider "concourse" {
  target = "local"
}

resource "concourse_pipeline" "sam" {
  team_name     = "main"
  pipeline_name = "sam"
  is_exposed    = false
  is_paused     = false

  pipeline_config        = file("ci/pipelines/sam.yml")
  pipeline_config_format = "yaml"
}

output "pipeline_yaml" {
  value = concourse_pipeline.sam.yaml
}

