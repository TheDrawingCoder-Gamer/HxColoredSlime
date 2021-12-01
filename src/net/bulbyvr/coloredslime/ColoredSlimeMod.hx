package net.bulbyvr.coloredslime;

import net.minecraft.util.Identifier;
import net.minecraft.block.Block;
import net.minecraft.util.DyeColor;
import net.bulbyvr.coloredslime.util.Helpers;
import net.fabricmc.api.ModInitializer;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
class ColoredSlimeMod implements ModInitializer {
    public static final MOD_ID = "coloredslime";
    public static var SLIMES:Map<String, Block>;
    public static var HONEYS:Map<String, Block>;
    public static var LOGGER:Logger = LogManager.getLogger(MOD_ID);
    // JVM BUG:
    // Type.allEnums does NOT work correctly in JVM
    // Thus we must do it ourselves
    public static function colors():Array<java.lang.Enum<DyeColor>> {
        var vals:java.NativeArray<java.lang.Enum<DyeColor>> = untyped DyeColor.values();
        
        return java.Lib.array(vals);
        
    }
    public static function makeId(name:String) {
        return new Identifier(MOD_ID, name);
    }
    public function new() {}
    public function onInitialize():Void {
		SLIMES = Helpers.generateSlimeBlocks();
        HONEYS = Helpers.generateHoneyBlocks();
        LOGGER.info(colors());
		for (color in colors()) {
            var slimeName = color.name().toLowerCase() + "_slime_block";
            var slimeBlock = SLIMES.get(color.name());

            Helpers.registerBlock(slimeName, slimeBlock);
            Helpers.registerItem(slimeName, slimeBlock);
            var honeyName = color.name().toLowerCase() + "_honey_block";
            var honeyBlock = HONEYS.get(color.name());
            Helpers.registerBlock(honeyName, honeyBlock);
            Helpers.registerItem(honeyName, honeyBlock);
        }
    }
}