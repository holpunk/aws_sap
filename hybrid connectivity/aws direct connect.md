aws direct connect DX
     connect data center to aws using private connection
     no internet
     private network link of aws
     advantages in terms of bandwidth, lateny and consistent network performance
     cost more than if you just establish aws managed VPN
     if you send lot more data to aws. then it does cost lower. 


     aws cloud     ------ aws direct connect location  -------- corporate data center

      direct location
        found in many cities arround the world

    aws direct connect location
        aws cage
            aws side equipment with networking
        customer cage
            your equipment with networking
        partner cage
            apn with networking

            customer cage can be connected to partner cage and partner cage can be connected to the aws cage. and form a communication on that basis. 

        aws direct connect endpoint   ------- customer / Partner router

        dx port must be allocation in dx location


        weeks to months for the setting up
        and there we set up physical fibre connection to aws running at 1 GBPS and 10GBPS connection speed

        Benefits
            private connectivity between aws and your data center / office.


Private VIF
    connects to a single vpc in the same aws region using VGW

public vif
    can be used to connect to aws services in any region but not using public internet  f