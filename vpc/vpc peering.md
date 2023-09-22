vpc peering
    we would like instances from VPC's to communicate each other.
    same region
    different region
    same az
    different az
    to allow communication between them. we can enable vpc peering in between vpc
    condition
        cidr block must not overlap
    it never touches internet as in vpc peering aws global network is used to communicate in between instances of different vpc
    it does get encrypted while moving in between regions uses private ipv4 and ipv6 addresses
    it does not supports transitive peering. so every vpc must establish a connection with other vpc standalone
    after establishing vpc peering connection. private addresses are used in vpc peering connection.