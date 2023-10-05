vpc routing deep dive
    vpc with same cidr block can not be peered together. as cidr block should not overlapgit 
    longest prefix wins

172.16.0.0

    VPC to VPC
        static route
        it is preferable over propogated route
    VPC to DC
        propogated route
        routes are learned and propogated by BGP to route table


gateway route table
    