# node elk.local {}
class elk {
  class {'logstash':}
  logstash::plugin {'logstash-input-beats':}
  logstash::configfile{'beats':
    source => 'puppet:///modules/elk/beats.conf',
  }


  include ::java
  class { 'elasticsearch':
    jvm_options => ['-Xms256m','-Xmx256m'8:-XX:NumberOfGCLogFiles=32','8:-XX:GCLogFileSize=64m','8:-XX:+UseGCLogFileRotation','8:-XX:+PrintTenuringDistribution','8:-XX:+PrintGCDateStamps','8:-XX:+PrintGCApplicationStoppedTime','8:-XX:+UseConcMarkSweepGC','8:-XX:+UseCMSInitiatingOccupancyOnly','11:-XX:+UseG1GC','11:-XX:InitiatingHeapOccupancyPercent=75']
  }
  elasticsearch::instance { 'es-01': }

  class {'kibana':
    config => {
      'server.host' => '0.0.0.0'
    }
  }
}
