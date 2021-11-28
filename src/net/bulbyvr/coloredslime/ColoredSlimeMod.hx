package net.bulbyvr.coloredslime;
import net.minecraft.util.Identifier;
import net.minecraft.block.Block;
import net.minecraft.util.DyeColor;
import net.bulbyvr.coloredslime.util.Helpers;
import net.fabricmc.api.ModInitializer;

class ColoredSlimeMod implements ModInitializer {
    public static final MOD_ID = "coloredslime";
    public static var SLIMES:Map<DyeColor, Block> = Helpers.generateSlimeBlocks();
    public static var HONEYS:Map<DyeColor, Block> = Helpers.generateHoneyBlocks();
    public static function makeId(name:String) {
        return new Identifier(MOD_ID, name);
    }
    public function new() {}
    public function onInitialize():Void {
        for (color in Type.allEnums(DyeColor)) {
            var slimeName = color.getName().toLowerCase() + "_slime_block";
            var slimeBlock = SLIMES.get(color);

            Helpers.registerBlock(slimeName, slimeBlock);
            Helpers.registerItem(slimeName, slimeBlock);

            var honeyName = color.getName().toLowerCase() + "_honey_block";
            var honeyBlock = HONEYS.get(color);
            Helpers.registerBlock(honeyName, honeyBlock);
            Helpers.registerItem(honeyName, honeyBlock);
        }
    }
}