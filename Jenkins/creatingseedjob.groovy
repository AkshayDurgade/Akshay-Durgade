folder('JobDSLs') {
    freeStyleJob('JobDSLs/Jobs') {
        scm {
            git {
                branch('main')
                remote{
                    url('https://github.com/AkshayDurgade/Assignment7_seed-jobs.git')
                }
            }
        }
        steps {
            dsl {
                external('JobDSL/*/folder.jenkins')
                external('JobDSL/**/*_job.jenkins')
            }
        }
    }
}
    
        