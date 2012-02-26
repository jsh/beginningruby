$description = Hash.new

$description[:central_corridor] = <<DESC
The Gothons of planet Percal #25 have invaded your ship
and destroyed your entire crew.  You are the last surviving member
and your last mission is to get the Neutron DESCestruct Bomb
from the Armory, put it in the bridge,
and blow the ship up, after getting into an escape pod.

You're running down the central corridor to the Weapons Armory,
when a Gothon jumps out: red scaly skin, dark grimy teeth, and an evil clown costume
flowing around his hate-filled body.  He's blocking the door to the Armory
and about to pull a weapon to blast you.
DESC


$description[:laser_weapon_armory] = <<DESC
You do a dive into the Weapon Armory, crouch and scan the room
for more Gothons that might be hiding.  It's dead quiet, too quiet.
You run to the far side of the room and find the neutron bomb in its container.
There's a keypad lock on the box and you need the code to get the box out.
If you get the code wrong 10 times then the lock closes forever and you can't get the bomb.
The code is three digits
DESC

$description[:the_bridge] = <<DESC
You burst onto the bridge with the netron destruct bomb under your bomb
and surprise 5 Gothons who are trying to take control of the ship.
Each of them has an even uglier clown suit than the last.
They haven't pulled their weapons out yet,
as they see the active bomb under your arm and don't want to set it off.
DESC

$description[:escape_pod] = <<DESC
You rush through the ship, desperately trying to make it
to the escape pod before the ship explodes.
It seems like hardly any Gothons are on the ship, so your run is clear of interference.
You get to the chamber with the escape pods, and now need to pick one to take.
Some of them could be damaged, but you don't have time to look.
There are five pods.  Which one do you take?
DESC

$description[:shoot] =<<DESC
Quick on the draw, you pull out your blaster and fire it at the Gothon.
His clown costume is flowing around his body, which throws off your aim.
Your laser hits his costume but misses him entirely.
This ruins his brand-new costume his mother bought for him,
which makes him fly into an insane rage and blast you in the face
repeatedly until you are dead.  Then he eats you.
DESC

$description[:dodge] =<<DESC
Like a world-class boxer you weave, dodge, slip and slide right
as the Gothon's blaster cranks a laser past your head.
In the middle of your artful dodge, your foot slips
and you bang your head on the metal wall and pass out.
You wake up shortly after only to die as the Gothon stomps on your head
and eats you.

$description[:"tell joke"] =<<DESC
Lucky for you, they made you learn Gothon insults in the academy.
You tell the one Gothon joke you know:
Lkjfapuiriup jfkljkaf vuornvoi nqrpvyurqnm.
The Gothon stops, tries not to laugh, then bursts out laughing and can't move.
While he's laughing, you run up, and shoot him square in the head,
putting him down, then jump through the Weapons Armory door.
DESC

$description[:good_guess] =<<DESC
The container clicks open and the seal breaks, letting gas out.
You grab the neutron bomb and run as fast as you can
to the bridge where you must place it in the right spot.
DESC

$description[:bad_guess] =<<DESC
The lock buzzes one last time and then you hear a sickening melting sound
as the mechanism is fused together.
You decide to sit there, and finally the Gothons blow up the ship
from their ship, and you die.
DESC

$description[:throw_the_bomb] =<<DESC
In a panic you throw the bomb at the Gothons and make a leap for the door.
Right as you drop it, a Gothon shoots you in the back, killing you.
As you die, you see another Gothon frantically trying to disarm the bomb.
You die knowing they will probably blow up when the bomb goes off.
DESC

$description[:slowly_place_the_bomb] =<<DESC
You point the blaster at the bomb under your arm
and the Gothons put up their hands and start to sweat.
You inch backward to the door, open it and carefully place the bomb on the floor,
pointing your blaster at it.
You then jump back through the door, punch the close button,
and blast the lock so the Gothans can't get out.
Now that the bomb is placed, you run to the escape pod
to get off this tin can.
DESC


$description[:bad_pod] =<<DESC
You jump into pod %s and hit the eject button." % guess
The pod escapes out into the void of space
then implodes as the hull ruptures, crushing your body into jelly.
DESC

$description[:good_pod] =<<DESC
You jump into pod %s and hit the eject button." % guess
The pod easily slides out into space, headed to the planet below.
As you fly toward the planet, you look back and see your ship implode
like a bright star, taking out the Gothon ship at the same time.
You won!
DESC

$description[nil] =<<DESC
DOES NOT COMPUTE
DESC


$choices = {
	:central_corridor => ['shoot!', 'dodge!', 'tell joke'],
	:the_bridge => ['throw the bomb', 'slowly place the bomb'],
	:escape_pod => [1,2,3,4,5],
	:laser_weapon_armory => ['keypad'],
}

$cheatcode = {
	:central_corridor => 'tell joke',
	:the_bridge => 'slowly place the bomb',
	:laser_weapon_armory => 'xxx',
}
