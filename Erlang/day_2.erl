-module(day_2).
-export([find_lang/2]).
-export([calc_total_price/1]).

find_lang([], _) -> notfound;
find_lang([{Lang, LangDescription} | Rest], RequiredLang) -> case Lang of
    RequiredLang -> LangDescription;
    _ -> find_lang(Rest, RequiredLang)
end.

calc_total_price(Items) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- Items].
