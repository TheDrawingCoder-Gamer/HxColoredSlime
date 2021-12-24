package java.lang;

extern abstract class Record {
    @:protected
    function new();
    abstract function equals(other:Dynamic):Bool;
    abstract function hashCode():Int;
    abstract function toString():String;
}