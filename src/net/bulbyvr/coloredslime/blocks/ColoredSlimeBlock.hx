package net.bulbyvr.coloredslime.blocks;

import net.minecraft.block.Blocks;
import net.fabricmc.fabric.api.object.builder.v1.block.FabricBlockSettings;
import net.minecraft.util.DyeColor;
import net.minecraft.block.SlimeBlock;

class ColoredSlimeBlock extends SlimeBlock {
    public function new(color:DyeColor) {
        super(FabricBlockSettings.copyOf(Blocks.SLIME_BLOCK).mapColor(color).nonOpaque());
    }
}