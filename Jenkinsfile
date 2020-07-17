#!/usr/bin/env groovy
node { 
    stage('set_running') {
        echo 'Wird beim Build in der Jenkinspipeline aufgerufen' 
    }
    stage('Test') {
        robot testsuites/APEX_Laufen
    }
    stage('set_finish') {
        echo 'setze finish Status' 
    }
    stage('cleanup') {
        echo 'müll ausleeren' 
    }
}
