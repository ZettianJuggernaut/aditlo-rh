function inv_item_create_common(iName,iType,iSum,iCap,iSpr,iDescr){

//Creating a effect selection with chances of being used
var effectSelection = array_create(4);
var indexX = 0, indexY = 0;				//Chance of being used in %
effectSelection[indexX++,indexY] = 50;	//%50
effectSelection[indexX++,indexY] = 75;	//%25
effectSelection[indexX++,indexY] = 85;	//%10
effectSelection[indexX,indexY++] = 100;	//%15
indexX = 0;								//Effect Type
effectSelection[indexX++,indexY] = "Heal";
effectSelection[indexX++,indexY] = "Heal";
effectSelection[indexX++,indexY] = "Heal";
effectSelection[indexX,indexY++] = "Poison";
indexX = 0;								//Effectness Strength
effectSelection[indexX++,indexY] = 1;
effectSelection[indexX++,indexY] = 2;
effectSelection[indexX++,indexY] = 3;
effectSelection[indexX,indexY++] = 2;

var iEffect = random(100), iEffectness;
for(indexX = 0; indexX < array_length(effectSelection); indexX++) {
	if(iEffect <= effectSelection[indexX,0]) {
		iEffect = effectSelection[indexX,1];
		iEffectness = effectSelection[indexX,2];
		break;
	}
}

//Getting an unused item number and using it to setup an item
var itemId = "item1",
n = "1",
n2;
iSpr = sprite_get_name(iSpr);
ini_open("item_info.ini");
while(ini_section_exists(itemId)) {
	n2 = real(n);
	n2++;
	n2 = string(n2);
	itemId = string_replace(itemId,n,n2);
	n = n2;
}
ini_write_string(itemId,"name",iName);
ini_write_string(itemId,"type",iType);
ini_write_real(itemId,"sum",iSum);
ini_write_real(itemId,"cap",iCap);
ini_write_string(itemId,"spr",iSpr);
ini_write_string(itemId,"descr",iDescr);
ini_write_string(itemId,"effect",iEffect);
ini_write_real(itemId,"effectness",iEffectness);
ini_close();
}