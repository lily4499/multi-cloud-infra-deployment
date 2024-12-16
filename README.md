In a Jenkinsfile, you can allow the selection of multiple resources for deployment using a multi-select parameter plugin 
or by using a String parameter and accepting comma-separated values for the selected resources. However, Jenkins' choice parameter inherently supports single selection only.

Options for Multi-Select Support:
1. Using extendedChoice for Multi-Select

You can install the Extended Choice Parameter Plugin to provide a multi-select option.


2. Using String Parameter with Comma-Separated Input

If installing a plugin isn't an option, you can use a String parameter where the user enters the resources as a comma-separated list:
