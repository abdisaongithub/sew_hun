import 'package:flutter/material.dart';

const kUsername = 'username';
const kEmail = 'email';
const kPassword = 'password';
const kToken = 'token';
const kAuthorization = 'Authorization';

Color textColor = new Color(0xFF775CB8);
const double defaultPadding = 20.0;
const double smallPadding = 10.0;
const double largePadding = 30.0;

const List<Map<String,String>> content = [
  {
    'title': "አራቱ ወንድማማቾችና አያ ጅቦ",
    'content':
        "በአንድ ወቅት አራት ወንድማማቾችና ከመንደራቸው አካባቢ የሚገኝ ጥቅጥቅ ያለ ጫካ ነበር፡፡ ይህ ጫካ ተደፍሮ የማያውቀው በጅቦች ንጉስ ስለሚተዳደር በመሆኑና በደኑ ውስጥ በጣም ብዙ አስፈሪ ጅቦች ስለሚዘዋወሩበት አንድም ሰው ድርሽ "
            "ስለማይልበት ነበር፡፡ ታዲያ ከእለታት አንድ ቀን አራቱ ወንድማማቾች ወደ ጫካው ዘልቀው በመግባትና ውስጡን ለመመልከት ወስነው ወደዚያው አቀኑ፡፡ ወደ ጫካው እንደዘለቁም መጀመሪያ ምንም አላጋጠማቸውም፡፡ ሆኖም ወደ ጫካው መሃል በደረሱ ጊዜ በብዙ የጅቦች ሰራዊትና በንጉሳቸው መከበባቸውን አስተዋሉ፡፡የጅቦቹም ንጉስ ጠርቷቸው \“እንዴት ብትዳፈሩ ነው ወደ ደኔ ውስጥ የገባችሁት? ወደ እኔ ንጉሳዊ ግዛት ውስጥ ደፍራችሁ እንድትገቡ ያበረታታችሁን ምክንያት ማወቅ እፈልጋለሁ፡፡\” አላቸው፡፡ የመጀመሪያውንም ወንድም ጠርቶ \“አንተ በማን ተማምነህ ነው?\” ብሎ ቢጠይቀው እሱም \“መመኪያዬ አምላኬ ነው፤ የዚህ ሁሉ አለም ፈጣሪ እንደፈጠረኝ ሁሉ የህይወቴ ትልምና የምሞትበትም ቀን ጭምር በመፅሃፉ ውስጥ ተፅፈው ይገኛሉ፡፡ ስለዚህ ምንም የሚያስፈራኝ ነገር የለም፡፡ ምክንያቱም ሁሉም ቀድሞ ተወስኖልኛልና፡፡\” ብሎ መለሰለት፡፡ የጅቦቹም ንጉስ ወደ ሁለተኛው ወንድም ዞሮ \“አንተስ መመኪያህ ማነው?\” አለው፡፡ ሁለተኛውም ወንድም \“የኔ መመኪያ የጎሳዬ አባላት ናቸው፡፡ እነርሱም በጣም ደፋርና ቁጡ ስለሆኑ ከቤተሰባቸው አንድም ሰው በከንቱ እንዲሞት አይፈቅዱም፡፡ ስለዚህ ማንም እኔን ቢገድል የጎሳዬ አባላት ሄደው ይበቀሉታል፡፡ ስለዚህ ማንንም አልፈራም፡፡\” አለው፡፡ የጅቦቹ ንጉስ ወደ ሶስተኛው ዞሮ \“አንተስ? በምንድነው የምትመካው?\” ብሎ ጠየቀው፡፡       ሶስተኛውም ወንድም \“እኔ የምመካው የሁላችንም እናት በሆነችውና እኔንም በፈጠረችኝ በምድራችን ነው፡፡ የመሞቻዬም ቀን በደረሰ ጊዜ ሞቼ የምቀበረው በእርሷ ውስጥ ነው፡፡ ስለዚህ እምነቴን ሁሉ በምድር ላይ ጥየዋለሁ፡\፡” ብሎ መለሰለት፡፡       በመጨረሻም ንጉሱ አራተኛውን ወንድም “አንተስ?\” ብሎ ቢጠይቀው አራተኛው ወንድም \“የእኔ መመኪያ እናንተ ጅቦች ናችሁ፡፡ አያችሁ፣ ጥቂት የጅብ ጓደኞች አሉኝ፡፡ እነርሱም በጣም ጠንካራ ጎበዞች ስለሆኑ በእናንተው በጅቦች ነው የምተማመነው\” ሲል መለሰለት፡፡       ንጉሱም ወታደሮቹን ጠርቶ እንዲህ አላቸው፡፡ \“ተመልከቱ፣ የመጀመሪው ሰው በፈጣሪ ነው የሚተማመነውና እኛም ከፈጣሪ ጋር መጣላት አንችልም፡፡ ስለዚህ በነጻ እንለቀዋለን፡፡ ሁለተኛው ሰው የሚመካው በጎሳዎቹ አባላት ስለሆነ ከጎሳ ጋር መጣላት እንደማንችል ግልፅ ነው፡፡ ስለዚህ እርሱም በሰላም ይሂድ፡፡ ሶስተኛውም ሰው በእናት ምድራችን የሚመካ በመሆኑ በላይዋ ላይ እየኖረ ከምድር ጋር ማን ይጋጫል? ስለዚህ እርሱም በሰላም ይሂድ፡፡ ነገር ግን አራተኛው ሰው የሚተማመነው በእኛው በጅቦች ነው፡፡ እኛም እርስ በእርስ ብንጣላ ምንም ችግር የለውምና በሉ እርሱን እንብላው፡፡\” ብሎ አራተኛውን ወንድም በሉት ይባላል፡፡",
  },
  {
    'title': "ጤናማ ትዳር",
    'content':
        "የሰዉ ልጆች ከመወለድ እስከ ሞት በተለያዩ ግንኙነቶች ታጅበን እንኖራለን ፡፡ ከእነኚህ ግንኙነቶች አንዱ ትዳር ሲሆን ዋና ከሚባሉ ግንኙነቶች ውስጥም ይመደባል፡፡ ጤናማና ጠንካራ ትዳር መሰረቱ ያመረ ቤትን ይመስላል፡፡ በወጀብ የማይናወጽ ፤ በጎርፍ የማይነቃነቅ ፤ ከችግኝነት እስከ ፍሬ ማፍራት በትዕግስትና በፈተና የሚጓዝ ነው፡፡ ትዳር ትልቁ ማኅበራዊ ተቋም ሲሆን ትዳሩ እስካልፈረሰ ድረስ የማንመረቅበት ትልቅ ትምህርት ቤት ነው፡፡ አንድ ገበሬ በብዙ ድካምና ልፍት የወዙን ምርት እንደሚያገኘው የትዳርም ውጤት በትዳራችን ላይ ምን ያህል እንደለፋን አቅጣጫን ያሳያል፡፡ ሰዎች ልምዳቸውንና ዕውቀታቸውን እንደሚመስሉ ሁሉ ዕለት ተዕለት የሚኖረን የትዳር ተሞክሮዎችና ውጥኖች ትዳራችንን እንደ አንድ ሰላማዊ ደሴት ወይም እስር ቤት እንድንቆጥረው ያደርገናል፡፡ ታዲያ የተለያዩ ሰዎች የተለያየ የትዳር ሁኔታ አላቸዉ የሰመረ/ደስተኛ እና ችግር ዉስጥ፡፡ ትዳርን የሰመረ/ደስተኛ ለማድረግ ሁለቱም ጥንዶች በጋራ መስራት አለባቸዉ ምንያቱም ትዳር በሰራነዉ ልክ ነዉ የሚወሰነዉ፡፡ መቻቻልን ሳይሆን ፍቅርንና መረዳዳትን (Understanding) መሠረት ያደረገ ትዳር ከእራስ አልፎ በሌሎች ዘንድ በተምሳሌትነቱ ይጠቀሳል፡፡ የሚያስቀና ትዳር አላቸው ተብሎ ውዳሴንና ክብርንም ያስገኛል፡፡ ይህ ታዲያ መሆን የሚችለው ትዳርን የፍቅር ትምህርት ቤት ፤ የሰላም ተቋም ፤ የባልና የሚስት የስራ ክፍፍል ተብሎ በማኅበረሰቡ ዘንድ የተቀመጠውን ድንበር አፍርሶ ቤተሰቡ ሊታነጽበትና ሊመራበት የሚችል መከባበር ፤የጋራ አመለካከትና አረዳድ ሲኖርው ብቻ ነው፡፡ ያ ሳይሆን ሲቀር ለመተጋገዝ የተመሰረተው ትዳር የጸብ ምንጭና የክርክር መድረክ ሆኖ ያበቃል፡፡ እንዲሁም ለፍቺ (divorce) አልያም ለቤት ውስጥ ጥቃት (domestic violence) በርን በመክፈት ይጓዛል፡፡ ደስተኛ/የሰመረ ትዳር መመስረት ለግለሰባዊ፣ ለቤተሰባዊ፣ ለማኅበረሰባዊ እና ለሀገራ ዕድገት ያለዉ አስተዋፅኦ ቀላል የሚባል አይደለም፡፡ እንደ ጋላገር እና ዌይት ትዳር ለአዕምሮ ጤንነት ጥሩ የሚባል ድጋፍ ያደርጋል፡፡ በተለይም ደስተኛ ትዳር የመሰረቱ ሰዎች ደስተኝነትን፣ ተስፈኝነትን፣ ጠንካራ መሆንና እና ጥሩ የመኖር ፍላጎትን ይጨምል፡፡ በተጨማሪም ለራሳችን ያለን ግምት እንዲያድግ ይረዳል፡፡ ሌላዉ የደስተኛ ትዳር ጥቅም ማኅበረሰባዊ ቀዉሶችን ይቀንሳል፡፡ ጎዳና የሚወጡ ልጆች፣ ከትምህርት የሚቀሩ፣ ሱሰኝነት እና ሌሎችም ማህበራዊ ቀዉሶች በደስተኛ እና ጤናማ ትዳር መቀነስ ይቻላል፡፡ ያገባችሁ ትዳራችሁን ተንከባከቡት በተንከባከባችሁት ልክ መልሶ የከፍላችኋል ፤ ያላገባችሁ ደግሞ ከጤናማ ትዳር ትምህርት ቅሰሙ፡፡"
  },
  {
    'title': "ህፃናት እንቅልፍ",
    'content':
        "እንቅልፍ ህፃናት በተወለዱ ጊዜ አብዝተው ይተኛሉ በቀን ከ 16-20 ሰአት የሚሆን ሰአታቸውን በንቅልፍ ያሳልፋሉ. እድሜያቸው 6-8 ሳምንት ሲሆን በቀን አጭር ለሆነ ጊዜ እና በምሽት ረዘም ላለ ሰአታት መተኛት ይጀምራሉ. እድሚያቸው ከ4-6 ወር በሚሆንበት ሰአት ብዙውን ጊዜ በአንድ ምሽት ከ8-12 ሰአታት ያህል ለሚሆን ጊዜ ይተኛሉ.በርካታ ህፃናት ግን እድሜያቸው 5-6ው ስከሚሆናን ድረስ የእንቅልፍ መዛባት ሊያጋጥማቸው ይችላል. ይህ አይነት ችግር ካጋጠመ ከጅምሩ ገና ማስተካከል ይኖርቦታል። "
            "ጥሩ የሆነ እንቅልፍ ልማድ እንዲኖራቸው"
            "\n• ልጅዎ በተደጋጋሚ የሸለብታ እንዲወስደው ያድርጉ የመጀመሪያዎቹ ሳምንታት በርካታ ህፃናት በአንድ ጊዜ ከሁለት ሰአት ለሚረዝም ጊዜ ነቅተው መቀየት አይችሉም።   \n• ለልጅዎ የቀን እና የማታ ልዩነት ያስተምሩ ለመጀመሪያዎቹ ሳምንታት ለዚህ ነገር ምን ማድረግ አይችሉም ነገር ግን 2 ሳምንት እድሜ ሲሆናቸው የቀንና በማታ ያለውን ልዩነት ለልጆዎ ማስተማር ይችላሉ። \n•በመቀን ጊዜ ላይ ንቁ እነዲሆኑ በሚችሉት አቅም ከነገሮች ጋር እየተግባቡ እንዲቆዩ ይርዱዋቸው. እንደተጨማሪ ቤቱን ብራማ (ብረሃን) እዲኖረውና የተለያዩ ድምፅ እንዱ ለምዱ ማድረግ (ለምሳሌ፡- የስልክ ፣ ሙዚቃ ፣ የእቃዎች ድምፅ ማስለመድ የቀኑን እና የማታውን የቀን ልዩነት እንዲያውቁ ይረዳቸዋል።ጊዜ ልጆች እንቅልፍ እንቢ ሊላቸው የሚችለው በጋዝ ምክንያት ሊሆን ስለሚችል.ህፃን ልጅዎን በማንሳትና እንዲያገሳ በማድረግ ሰላማዊ እንቅልፍ እንዲተኛ ማድረግ ይችላሉ።"
  },
  {
    'title': "የግጭት አፈታት ሳይኮሎጂ",
    'content': "ግጭት ጥልቅ ውስጣዊ ስሜቶች አደባባይ ላይ ወጥተው እንዲሰጡ ያደርግል፡፡ በዚህ ጊዜ በእውናችን ቀርቶ በህልማችን እንኳን አልመን የማናውቀውን ነገር ራሳችንም ሌሎችም ሲያደርጉ አስተውለን ይሆናል፡፡ አንዳንድ ጊዜ ሰዎች ለመስማት የሚከብድ ወንጀል ፈጸመው ወዳጅ ዘመዶቻቸው ስለእነዚሁ ሰዎች ጠባይ ሲጠየቁ “እሱ እኮ ሰውም ቀና ብሎ አይመለከት፣ ታላቁን አክባሪ፤ አንገት ደፊ ወዘተ ነበር” ሲሉ ይደመጣል፡፡ እንደተባለውም እነዚህ ሰዎች ሰው አክባሪ፣ ካልደረሱባቸው ሰው ላይ የማይደርሱ ይሆናሉ፡፡ መስካሪዎቹ ፊት ለፊት ያዩትን ነው የመሰከሩት፡፡ ነገር ግን እነዚህ መስካሪዎች አይተውት የማያውቁት አጥፊ ስሜት እነዚህ ሰዎች ውስጥ ይኖራል፤ ተመልካች ይቅርና ባለቤቱም ራሱ አያውቀው ይሆናል፤ ጆሮ ለባለቤቱ ባዳ ነው እንዲሉ፡፡ ይህ ማለት ግን በስሜት ተገፋፍተን በፈጸምነው ድርጊት ተጠያቂ አንሆንም ማለትም አይደለም፡፡ ዞሮ ዞሮ ስሜቶቻችንም የገዛ ራሳችን ንብረት እንጂ የማንም አይደሉም፡፡ ግጭት የሚያስከትለውን ውድመት የበዛ የሚሆንበት ዋነኛ ምክንያት ከመፈጠሩ በፊት ለመከላከልም ሆነ ከተፈጠረ በኋላ በሰላማዊ መንገድ ለመፍታት የሚያስችል ዕውቀት እና ክህሎት እጦት ነው፡፡ በትንሽ በትልቁ ብስጭት የሚሉ ሰዎችን ታውቁ ይሆናል፤ ለምን ቀና ብላችሁ በሙሉ ዓይናችሁ ተመለከታችሁኝ ብለው ችግር የሚፈጥሩ እና ችግር ውስጥ የሚገቡ ሰዎች ሊሆኑ ይችላሉ፡፡ በምዕራቡ ዓለም ለእንደዚህ ዓይነት ሰዎች ‹ንዴትን መቆጣጠር› የሚችሉበት የተለየ ስልጠና ቁጭ ብለው እንዲወስዱ ይደረጋል፡፡ ልክ እንደዚሁ ሁሉ ግጭትን መከላከልም ሆነ መፍታት በስልጠና ሊደረጅ የሚችል ችሎታ ነው፡፡ በዚህ ጽሑፍ ግጭትን ለመከላከል እና ለመፍታት የሚረዱ ነጥቦችን እንዳስሳለን፡"
        "\n1. ስናዳምጥ ‹ጥቃትን› አናዳምጥ"
        "\nጥቃት እየተፈጸመብን ነው ብለን ከአሰብን አጸፋዊ መልስ ለመስጠት አናቅማማም፡፡ ክፉ ደግ መነጋገር ደግሞ ምክንያታዊ ውይይት ድራሹ እንዲጠፋ ያደርጋል፡፡ በተለይ ግጭት ከተፈጠረ በኋላ ማንኛውም ዓይነት ንግግር ሲደረግ ‹ይህ ሰው በትክክል ምን እያለ ነው?›፣ ‹ምን ዓይነት መረጃ ነው በመተላለፍ ላይ የሚገኘው?›፣ ‹ምንድነው የተከፋበት ምክንያት? ለምን ተቆጣ? ለምን ክፉ ተናገረ?›ወዘተ በማለት በስሜት ታጅበው ከሚፈሱት ቃላት ጀርባ ያለውን መልዕክት ለይቶ ማወቅ ጥሩ ነው፡፡ ይህንን ከአደረግን ራስን ለመከላከል ከፍ ሲልም መልሶ ወደ ጥቃት ወደ መሰንዘሩ ከመኬዱ በፊት መግባባት እንዲነግስ ያደርጋል፡፡"
        "\n2. ደመ ነፍሳዊ ግፊት አደብ እንዲገዛ ማድረግ"
        "\nየምንፈልገው እንዳልተሟላ፣ ፍትህ እንደጎደለ፣ ውሸት እንደከበረ፣ መስማት የማንፈልገው ጥያቄ እንደቀረበ ወዘተ ስናስብ እጥፍ ድርቡን መልሳችሁ አከናንቡ የሚል ውስጣዊ ደመ ነፍሳዊ ግፊት ይቀሰቀሳል፡፡ እስከ ዶቃ ማሰሪያው፣ አፍንጫው ድረስ፣ ልክ ልኩን ወዘተ ነገረው ዓይነት ፈሊጣዊ አገላለጾቻችን ‹ክፉ ነገርን ልክ የለሽ በሆነ ክፍት መመከትን› እንደምናበረታታ ፍንጭ የሚሰጡ ናቸው፡፡ አጥቂ ምክንያታዊ ይሁንም አይሁንም፣ ደግ ይሁንም አይሁንም አበጀህ የማለት፣ እንደ ጀግና ከፍ አድርጎ የመመልከት ባህል ሊወገድ ይገባል፡፡ በግጭት ወቅት ‹እንዲህ በል፣ እንዲያ በል፣ የት አባቱ ወዘተ› ዓይነት ውስጣችን የሚፈሉ የደመ ነፍስ ግፊቶችን ማቀዛቀዝ ግጭትን ለመፍታት ይረዳል፡፡ ደመ ነፍሳዊ ምሪትን ከአስቆምን በኋላ ተረጋግቶ በማሰብ መናገር የምንፈልገውን ‹እኔ› በማለት መናገርም እንዲሁ ይመከራል፡፡ ለምሳሌ፣ በቤት ውስጥ የትዳር አጋር ስራ አላግዝ ብሎ አስቸግሮ ከሆነ ‹አንተ ድሮም ሰነፍ ነህ፣ ምንትስ ነህ› ከማለት ይልቅ ‹እኔ ስራ ካላገዝከኝ/ካላገዝሽኝ ቅር ይለኛል፤ ተጋግዘን ልንሰራ ይገባል፤ ይኼ እኮ የጋራ ህይወት ነው› ማለት ግጭት ላይ አርቆ ማጠሪያ ስልት ነው፡፡ ስለዚህ በተቻለ መጠን ውስጣችን አሉታዊ ስሜት ሲጸነስ እንደመጣልን ከመናገር እንቆጠብ፡፡ ‹ከአፍ የወጣ አፋፍ› አይደል ከነአባባሉስ፡፡ ንግግር የፈሰሰ ውሃ ነው፡፡ እንደ ደራሽ ውሃ ፈሶ ያለ የሌለውን ጠራርጎ ከሄደ በኋላ ሁኔታዎችን ወደ ነበሩበት መመለስ ፈታኝ ነው፡፡ ስለሆነም ንግግር ሲያደርጉ ማመዛዘን እንዲሁም ከአንደበታችን የሚወጡ ቃላት ግጭቱ ላይ ሄደው ሲያርፍ የቤንዚን ነው ወይስ የውሃ ሚና የሚጫወቱት የሚለውን ቀድሞ ማሰብ ተገቢ ነው፡፡ "
        "\n3. የሰዎችን በጎ ጎን ማነጋገር"
        "\n100 % አጥፊ፣ ምንም ነገር የማይገባው፤ ውስጡ እንጥፍጣፊ መልካምነት የሌለው ወዘተ ሰው አይኖርም፡፡ የትኛውም ሰው መልካም ማንነት የማንነቱ አካል ነው፡፡ እርስ በእርስ ስንነጋገር አንዳችን የአንዳችንን ይህንን መልካም ጎን ለማነጋገር ጥረት እናድርግ፡፡‹ጅኒ› ገለመሌ የሚል አጓጉል ፍረጃ ውስጥ ሳንገባ መልአኩን ማንነት እናወያየው፡፡የሰው የእምነቱ መነሻ ስረ መሰረት የአንድም ይሁን የብዙ የሰው ልጅ ፍቅር ነው ብዬ አምናለሁ፡፡ አንድ ድፍን ያለ ‹ነጭ› አለያም ደግሞ ድፍን ያለ ‹ጥቁር› ብቻ ሊሆን አይችልም፡፡ፈረንጆቹ እንዲህ ዓይነቱን ጠርዘኛ አመለካከት ‹‹either/or thinking›› ይሉታል፡፡ እንዲህ ዓይነቱ አስተሳሰብ ራስንም ሆነ ሌሎችን አውዳሚ ነው፡፡ ከ‹ሰይጣን› ሌላ ሙሉ ለሙሉ ‹ሰይጣን› የሆነ ፍጥረት የለም፡፡"
  },
  {
    'title': 'ከወሊድስ በኋላ መቼ ወሲብ መጀመር ትችያለሽ?',
    'content': "አንዳንድ ጥንዶች የሴቷ ማርገዝ በወሲብ ህይወታቸው ላይ ምንም አይነት ለውጥ ባይፈጥርባቸውም በአብዛኛው እርግዝና የወንዱንም ሆነ የሴቷን የወሲብ ፍላጎት ይቀይረዋል። የተወሰኑ ጥንዶች እርግዝና የተሻለ የወሲብ ህይወት እንደሰጣቸው ሲመሰክሩ ሌሎች ከባድ ጊዜ ሊያሳልፉ ይችላሉ። ሆኖም በተለይ ከወሊድ በኋላ ብዙዎች ረዘም ያለ እረፍት ይወስዳሉ። በዚህ ወቅት በፊት የነበራችሁ ጥሩ የወሲብ ህይወት በጣም እንዳይቀየር ዋናው መፍትሄ ስለምትፈልጉት እና ስለሚሰማችሁ ነገር በግልፅ መወያየት ነው። ሁለታችሁንም የሚያረካ መፍትሄ ፈልጉ። ከዚህ በታች ብዙ ጥንዶች ስለ ወሲብ የሚያሳስቧቸው ነገሮች ተዘርዝረዋል። በሃገራችን ባህል ስለነዚህ ጉዳዮች በግልጽ ማውራት ሊከብድ ይችላል። ይህ ከሆነ ከባለቤትሽ/ባለቤትህ ጋር በመሆን ይህንን ፅሁፍ ማንበብ ነገሮችን ሊያቀል ይችላል።"
        "\nየግብረ ሥጋ ግንኙነት በእርግዝና ወቅት በእናቲቱ ወይም በልጁ ላይ ችግር ይፈጥር ይሆን?"
        "\nይህ ጥያቄ ብዙዎችን የሚያሳስብ ነው። በአጠቃላይ መልሱም በፍፁም ነው። ሴቷ በወሲብ ወቅት በምትረካበት ጊዜ በማህፀን ላይ የመኮማተር (የመጫን) ስሜት ሊፈጥር ይችላል። የእምስ ግርግዳ ስለሚሳሳ በግንኙነት ወቅት በትንሹ ሊደማ ይችላል። እኚህ ሁኔታዎች ባይመቹም በብዛት አደጋ የላቸውም። ለመጀመሪያ ጊዜ የደማሽ እንደሆነ ወይም አደማምሽ ካሳሰበሽ ሃኪምሽን አማክሪ። የደማሽው መጠኑ ብዙ ከሆነ ግን በፍጥነት ወደ ሆስፒታል ሂጂ። ጥሩ ግንኙነት ስለመፈፀም ሆድሽ ወደፊት ሲገፋስ? "
        "ሆድሽ በሚገፋበት ጊዜ ለወሲብ የሚመች አኳኋን ማግኘት ከባድ ሊሆን ይችላል። ሆኖም ዋናው ነገር የሚመቻችሁን አይነት መንገድ እስክታገኙ መሞከር ነው። ሴቷ በጎኗ ብትተኛ ወይም በጉልበቷ ብትንበረከክ የበለጠ ሊመቻችሁ ይችላል።"
        "\nወደ እርግዝና መጨረሻ"
        "\nበዚህ ጊዜ የበለጠ ጥንቃቄ ማድረግ ያሻል። ጉልብት የበዛው ግንኙነት ማድረግ አይመከርም። ቢሆንም አንደኛው ወገን ወሲብ ማድረግ ፈልጎ ሊላኛው ወገን ባይፈልግ ሌሎች ፍቅርን ለመግለፅ ሊደረጉ የሚችሉ ነገሮች አሉና መረሳት የለባቸውም።"
        "\nከወሊድ በኋላ"
        "\nወሊድ በእያንዳንዷ እናት ላይ የሚፈጥረው ስሜት ይለያያል። ቀላል ወሊድ ከነበረ በቶሎ ወደነበረው ሁኔታ ለመመለስ ይቀላታል። ከባድ ወሊድ ያሳለፈች እናት ደግም አእሮዋም ሆነ ሰውነቷ ዝግጁ እስኪሆን ረዘም ያለ ጊዜ ሊወስድባት ይችላል።በወሊድ ወቅት የማህፀን መውጫ እና አካባቢው ሊቆስልና ህመም ሊሰማ ይችላል። ሆኖም ይሄ የሚድን ሁኔታ ነውና ሊያሳስብሽ አይገባም። በሰውነትሽ ውስጥ ያለው የኤስትሮጅን መጠንም ይቀንሳል። በዚህ ምክንያትም እንደበፊቱ እርጥበት ላይሰማሽ ይችላል፤ ነገር ግን ይሄ የተለመደ ነው። ሊረዳሽ የሚችል ቅባት በፋርማሲዎች ስለሚገኝ ሐኪምሽን ማማከር ትችያለሽ።"
        "\nከወሊድ በኋላ ግንኙነት ማድረግ የሚቻለው መቼ ነው?"
        "\nከአራት እስከ ስድስት ሳምንት በኋላ ሁኔታዎች በፊት እንደነበሩት ለመመለስ ቢችሉም ብዙ ጥንዶች የበለጠ ጊዜ ይወስድባቸዋል። አዲስ ወላጆች እንደመሆናቸው በቤታቸው ለመጣው እንግዳ ህይወት ብዙ ትኩረት ስለሚሰጡ ላያስባቸውም ይችላል።አብሮ በመተኛት እና በመጨዋወት ቀስ በቀስ ድሮ ወደነበረው ፍቅራቸው በሂደት መመለስ ይችላሉ። ይህ እንደገና ለመላመድ እድል ይሰጣቸዋል። ስለስሜታቸው በግልፅ መወያየት በጣም ጥሩ ነው። በተጨማሪ ስለዚህ ጉዳይ ሐኪምን ማማከር ይቻላል።"
  },
  {
    'title': "ትኩረት አልባነት (Inattentiveness)",
    'content': "አንጎል ሁለት ስራዎችን በአንዴ ሊከውን አይችልም፤ በተፈጠረው።"
        "\nበመሆኑም እያሰቡ ወይም ከሌላ ሰው ጋር እያወሩ ወይም እየተጫወቱ ማጥናት ሁለት የተለያዩ ስራዎች ናቸውና አንጎል በጥሞና ለመከወን ይቸገራል። በመሆኑም በዚህ መልክ የሚጠኑ ትምህርቶችም የመታወስ አቅማቸው እጅግ አናሳ ነው። መፍትሔው ፦ በሚጠናው ነገር ላይ ሙሉ በሙሉ ትኩረትን ሰብስቦ ማጥናት አማራጭ የሌለው ስልት ነው። አለበለዚያ ግን ትርፉ ራስን ማታለልና ጊዜን በከንቱ ማባከን ነው። "
        "\nዕድሜ"
        "\nሁላችንም እንደምናውቀው የህፃናት አንጎል እንደነጭ ወረቀት የያዘውን ሁሉ ልቅም የሚያደርግ ነው። ለዚህ ደግሞ ዋናው ምክንያት ካሁን ቀደም በውስጡ ምንም መረጃ ስላልያዘ አንጎላቸው በመረጃ ግጭት ሳቢያ የመምታታት አባዜ ስለማይኖረው ሲሆን በይዘቱም አዲስ በመሆኑ ጭምር ነው። ይህ  የአንጎል ተፈጥሯዊ መረጃ የማስቀመጥ አቅም ከጊዜ ወደ ጊዜ (ብዙ ከማገልገሉ አንፃር) እየደከመ ይሄዳል። ይህ ደግሞ በብዛት መስተዋል የሚጀምረው ከ40 ዓመት ጀምሮ ይሆናል። ለዚህም አንዱ ምክንያት አንጎል የብዙ አመታት መረጃዎችን አጠራቅሞ በመያዙ ለመረጃዎች ግጭት የተጋለጠ በመሆኑና የአንጎል ህዋሳትም እያረጁና በቁጥርም እየቀነሱ መምጣት ነው። በመጨረሻም ወደ 70ዎቹ ዕድሜዎች ሲደርስ ጥቂት የማይባሉ ነርቮች ያረጃሉ። መጃጀትንም ያስከትላሉ። ይህም በከፍተኛ ደረጃ ነገሮችን ለመርሳት ያጋልጣል። መፍትሔው ፦ ሁሉም ነገር በጊዜው ያምራልና ወርቃማውን የአንጎል ብቃት በሚገባ ለመጠቀም በወጣትነት ዘመን ለመማር መትጋት ይመረጣል። ከኮሌጅም የተመረቁ ምሩቃን ጊዜ ሳያባክኑ ቀጣይ የድህረ ምረቃ ትምህርቶችን ቢከታተሉ ይመከራል።"
        "\nአልዚመር"
        "\nይህ ለከባድ የመርሳት አባዜ የሚያጋልጥ የአንጎል ህመም ነው። አልዚመር በአንጎል ውስጥ የመረጃዎችን ፍሰት ከሚያውጠነጥኑና አሴታይል ኮሊን የተባሉ ቅመሞች ምርት ማጠርን ተከትሎ የሚከሰት ነው። እንዲሁም ልክ እንደ መጃጀት በዛ ያሉ የአንጎል ነርቮችም ለጉዳት ስለሚጋለጡ ለዚህ ችግር ያደርሳሉ። አንድም የዚህ ህመም ተጠቂ በጊዜ ሂደት ሙሉ በሙሉ ትውስታ ይርቀዋል። በመጨረሻም የራሱን ማንነት ፣ ቤተሰቡን ወይም ልጆቹን ሳይቀር ይረሳል። ለዚህ ምሳሌ የሚሆኑን የአሜሪካው ፕሬዚዳንት ሬገን ናቸው። መፍትሔው ፦ እስካሁን አመርቂ መፍትሔ የለውም።"
  }
];
