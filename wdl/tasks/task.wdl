version 1.0

task hello {
    input {
        String name
        File request
    }

    command {
        echo 'Hello ${name}!' > resp.txt
        cat ${request} >> resp.txt
    }

    output {
        File response = "resp.txt"
    }

    runtime {
        docker: "cr-cn-beijing.volces.com/bio-island/busybox:1.30.0"
        memory: "1 GB"
        cpu: "1"
        disk: "0.5 GB"
    }
}
