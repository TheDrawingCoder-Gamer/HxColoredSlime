package net.bulbyvr.coloredslime.util;

import net.minecraft.util.Rarity;
import net.minecraft.item.ItemGroup;
import net.minecraft.item.Item;
import net.minecraft.item.BlockItem;
import net.minecraft.util.registry.Registry;
import net.bulbyvr.coloredslime.blocks.ColoredHoneyBlock;
import net.bulbyvr.coloredslime.blocks.ColoredSlimeBlock;
import net.minecraft.block.Block;
import net.minecraft.util.DyeColor;

class Helpers {
    public static function isColoredSlime(block:Block):Bool {
        return (block is ColoredSlimeBlock) || (block is ColoredHoneyBlock);
    }
    public static function generateSlimeBlocks() {
        var slimeBlocks:Map<DyeColor, Block> = [];
        for (color in Type.allEnums(DyeColor)) {
            slimeBlocks.set(color, new ColoredSlimeBlock(color));
        }
        return slimeBlocks;

    }
	public static function generateHoneyBlocks() {
		var honeyBlocks:Map<DyeColor, Block> = [];
		for (color in Type.allEnums(DyeColor)) {
			honeyBlocks.set(color, new ColoredHoneyBlock(color));
		}
		return honeyBlocks;
	}
    public static function registerBlock(name:String, block:Block) {
        return Registry.register(Registry.BLOCK, ColoredSlimeMod.makeId(name), block);
    }
    public static function registerItem(name:String, block:Block) {
        return Registry.register(Registry.ITEM, ColoredSlimeMod.makeId(name), new BlockItem(block, 
            new net.minecraft.item.Item_Settings().maxCount(64).group(ItemGroup.REDSTONE).rarity(Rarity.RARE)));
    }
}