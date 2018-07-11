difference (){
    color ([1,0,0])
        translate([0,0,0]) 
        cube ([15,15,25]);
    translate([1,1,1]) 
        cube ([13,13,40]);
    translate([7.5,7.5,-1]) 
        cylinder (d=6, $fn = 40, h=50);
}
