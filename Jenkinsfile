pipeline {
        agent { label 'node-one' }
        stages {
            
            stage('TFint') {
                steps {
                    script {
                        sh '''
                        terraform providers --version
                        cd AWS_Infra
                        terraform init
                        '''
                        }//script
                    }//steps
                } //stage
            stage('TFPlan') {
                steps {
                    script {
                        sh '''
                        cd AWS_Infra
                        terraform plan -var-file="variables.tfvars"
                        #terraform plan -destroy
                        '''
                        }//script
                    }//steps
                }
            stage('Approval') {
                steps {
                    script {
                       def deploymentDelay = input id: 'Deploy', message: 'Deploy to production?', parameters: [choice(choices: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'], description: 'Hours to delay deployment?', name: 'deploymentDelay')]
                       sleep time: deploymentDelay.toInteger(), unit: 'HOURS'
                       }//script
                    }//steps
                }

            stage('TFapply') {
                steps {
                    script {
                        sh '''
                        cd AWS_Infra
                        terraform apply -auto-approve -var-file="variables.tfvars"
                        #terraform output
                        #terraform destroy -auto-approve
                        
                        '''
                        }//script
                    }//steps
                }
            }//stages
        // post {
        //     always {
        //         script {
        //         sh 'echo "Cleaning up the workspace"'
        //         sh 'rm -rf /home/ec2-user/workspace'
        //        }
        //     }
        // }//post
    }//pipeline