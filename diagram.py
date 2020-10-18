from diagrams import Cluster, Diagram
from diagrams.onprem.vcs import Gitlab
from diagrams.generic.blank import Blank

with Diagram("Module Flow", show=False):
    gitlab = Gitlab("Project")

    with Cluster("Pipelines"):
        pipelines = [
            Blank("pipeline_1"),
            Blank("pipeline_2")]

    with Cluster("Branches"):
        branches = [
            Blank("branch_1"),
            Blank("branch_2")]

    with Cluster("Variables"):
        variables = [
            Blank("var_1"),
            Blank("var_2")]

    pipelines >> gitlab
    branches >> gitlab
    variables >> gitlab
