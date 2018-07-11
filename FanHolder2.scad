module bar (){
    translate ([2.5,0,0]) cube ([140,2.5,2.5]);
}
module bars(){
    translate ([0,20,0]) bar();
    translate ([0,40,0]) bar();
    translate ([0,60,0]) bar();
    translate ([0,80,0]) bar();
    translate ([0,100,0]) bar();
    translate ([0,120,0]) bar();
}

module screwHoleForFan(){
    cylinder(r = 3, h = 4, $fn = 30);
}

module cableHolderUp (){
    color([1,0,0]) 
        translate ([0,-3,7]) 
            cube ([3,1,10]);
    color([1,0,0]) 
        translate ([0,-3,7]) 
            cube ([3,3,3]);
}

module ventilationHole (){
    cylinder (r=65, h=4, $fn=100); //big hole
}

module cableHolderDown (){
    color([1,0,0]) translate ([0,-3,9]) cube ([3,1,9]);
    color([1,0,0]) translate ([0,-3,15]) cube ([3,3,3]);
}
module side (){
    difference(){
        cube ([146,3,25]);
        translate ([18,-1,12.5]) 
            rotate ([270,0,0]) 
                cylinder(r = 8, h = 5, $fn = 40);
        translate ([128,-1,12.5]) 
            rotate ([270,0,0]) 
                cylinder(r = 8, h = 5, $fn = 40);
    }
    translate ([33,0,0])cableHolderUp();
    translate ([71.5,0,0])cableHolderDown();
    translate ([110,0,0])cableHolderUp();
}
module chassis (){
    side();
    translate ([0,146,0]) rotate ([0,0,270]) side();
    translate ([146,146,0]) rotate ([0,0,180]) side();
    translate ([146,0,0]) rotate ([0,0,90]) side();
    difference (){
        cube ([146,146,3]); //plate
        translate ([145/2,145/2,-.1])
            ventilationHole();
        translate ([10,10,-0.1]) screwHoleForFan();
        translate ([133,10,-0.1]) screwHoleForFan();
        translate ([10,136,-0.1]) screwHoleForFan();
        translate ([133,136,-0.1]) screwHoleForFan();
    }
    color ([0,1,0]) bars();
    color ([0,1,0]) translate([144.0,0,0]) rotate([0,0,90]) bars();
}
module screwHolderHole(){
    cylinder (r = 3, h = 32, $fn = 30);
}
module screwHolder(){
    translate ([0,0,0])
    color ([1,1,0])
    difference (){
        cube ([10,10,30]);
        translate ([5,5,-0.1])screwHolderHole();
    }
}
module completeModule(){
    difference (){
        cube ([400, 170, 31]);
        translate ([3,3,3]) cube ([394, 164, 29]);
        translate ([2,2,30]) cube ([396, 166, 3]);//small imprint
        translate ([15,15,-.1])
            cube ([135,135,5]);
        translate ([15+230,15,-.1])
            cube ([135,135,5]);
        translate ([7,7,-0.1]) screwHolderHole();
        translate ([7,163,-0.1]) screwHolderHole();
        translate ([393,7,-0.1]) screwHolderHole();
        translate ([393,163,-0.1]) screwHolderHole();
        translate ([200,7,-0.1]) screwHolderHole();
        translate ([200,163,-0.1]) screwHolderHole();
    }
    translate ([10,10,0])chassis();
    translate ([240,10,0])chassis();
    translate ([2,2,0]) screwHolder();
    translate ([2,158,0]) screwHolder();
    translate ([388,2,0]) screwHolder();
    translate ([388,158,0]) screwHolder();
    translate ([195,2,0]) screwHolder();
    translate ([195,158,0]) screwHolder();
}
difference (){
    union (){
        color ([0,0,1]) translate ([0,0+180,0])cube ([400,170,2]);
        color ([0,.2,1]) translate ([1,1+180,0])cube ([398,168,3]);
    }
    translate ([7,7+180,-0.1]) screwHolderHole();
    translate ([7,163+180,-0.1]) screwHolderHole();
    translate ([393,7+180,-0.1]) screwHolderHole();
    translate ([393,163+180,-0.1]) screwHolderHole();
    translate ([200,7+180,-0.1]) screwHolderHole();
    translate ([200,163+180,-0.1]) screwHolderHole();
}
completeModule();