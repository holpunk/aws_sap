SG and NACL
    these are 2 different network firewalls in vpc which controls inbound and outbound traffic

SG
    instance level
    netwrok interfae level of ec2 instance
    check for the rule which is allowed to specific subnet/instace in same az/instance in different az
    statefull
    only supports allow rules only
    a source can be IP, security group id
    seperate rules are defined for outbound traffic
NACL
    subnet level
    each inbound and outbound traffic goes from and into a subnet are goes through NACL
    filter the traffic as it enters and leaves subnet
    stateless

Statefull and stateless filewall

    statefull firewall allow the return traffic automatically
    this is what security group is.

    stateless firewall checks the rule for both the connection. source connection as well as return connection
    it does not understand the its the same connection. it treats the inbound connection as well as outbound connection both seperately.


best practice security groups



