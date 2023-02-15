import 'package:blog_template/datastore/mock/mock_data_store.dart';
import 'package:blog_template/model/comment.dart';

/// Mock data store with fake entities to test.
class CommentDataStore extends MockDataStore<Comment> {
  @override
  List<Comment> items = [
    // p001

    Comment(
        id: "cm001",
        userId: "u002",
        postId: "p001",
        dateGmt: DateTime(2021, 1, 3),
        content:
            "Curabitur laoreet odio vitae nisl dapibus venenatis. Quisque semper nulla neque, at hendrerit orci consequat vel."),

    Comment(
        id: "cm002",
        userId: "u001",
        postId: "p001",
        dateGmt: DateTime(2021, 1, 18),
        content:
            "Vivamus suscipit cursus ipsum, nec porta nunc varius vitae. Nullam tempus, metus ac scelerisque mollis, elit ligula lacinia erat, vel commodo diam odio ullamcorper augue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas."),

    Comment(
        id: "cm003",
        userId: "u002",
        postId: "p001",
        dateGmt: DateTime(2021, 2, 14),
        content:
            "Fusce venenatis, elit vitae cursus interdum, elit massa scelerisque lacus, nec ultricies sapien orci et enim. Duis quis vestibulum lorem, at placerat mi."),

    // p002

    Comment(
        id: "cm004",
        userId: "u002",
        postId: "p002",
        dateGmt: DateTime(2021, 2, 9),
        content: "Donec mattis ac mauris eu cursus."),

    Comment(
        id: "cm005",
        userId: "u001",
        postId: "p002",
        dateGmt: DateTime(2021, 4, 17),
        content:
            "Vivamus rutrum eget felis eu eleifend. Quisque nibh justo, rutrum eu turpis non, rutrum semper augue. Maecenas velit elit, malesuada a nibh at, eleifend sagittis orci."),

    Comment(
        id: "cm006",
        userId: "u002",
        postId: "p002",
        dateGmt: DateTime(2021, 5, 22),
        content:
            "Vestibulum dictum, nisi et ullamcorper elementum, enim risus pulvinar eros, sed varius leo nulla eu nulla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus sit amet accumsan lorem, ac consectetur est."),

    Comment(
        id: "cm007",
        userId: "u002",
        postId: "p002",
        dateGmt: DateTime(2021, 6, 9),
        content:
            "Phasellus mi nisl, facilisis ac nibh eu, placerat tempus ligula. Quisque in metus ut ligula cursus facilisis eget sit amet nisl. Etiam vehicula venenatis dolor sed aliquam. Aenean pulvinar libero et nisi elementum gravida. Mauris maximus metus eget nisl lobortis, vitae tempus purus lobortis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."),

    // p003

    Comment(
        id: "cm008",
        userId: "u002",
        postId: "p003",
        dateGmt: DateTime(2021, 6, 10),
        content: "Nunc ac fringilla augue. Ut interdum aliquam aliquam."),

    Comment(
        id: "cm009",
        userId: "u001",
        postId: "p003",
        dateGmt: DateTime(2021, 8, 25),
        content:
            "Nam est dui, porta a sapien vel, aliquet facilisis tortor. Sed vel porta est. Suspendisse pellentesque purus at tristique blandit. Sed mollis a tellus ut mollis. Nunc eros tortor, scelerisque ut lectus id, aliquam consequat odio."),

    // p004

    Comment(
        id: "cm010",
        userId: "u002",
        postId: "p004",
        dateGmt: DateTime(2021, 3, 14),
        content:
            "Fusce ullamcorper ex diam, nec malesuada nisi elementum a. Aliquam dolor felis, elementum sed orci ac, mattis laoreet dolor. Proin lacinia, dolor vel ultricies consequat, quam dolor sagittis sem, id elementum eros metus vestibulum elit. Pellentesque quis dui sapien. Nulla dictum, neque in elementum cursus, turpis velit fringilla nisl, in luctus nibh arcu molestie eros."),

    Comment(
        id: "cm011",
        userId: "u002",
        postId: "p004",
        dateGmt: DateTime(2021, 7, 2),
        content:
            "Ut tincidunt ex nec diam elementum, vel ultricies justo tincidunt. Morbi rhoncus hendrerit justo ac malesuada. Duis vestibulum, ligula in gravida egestas, mi ante rhoncus leo, in elementum quam quam ut ipsum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi urna justo, sodales nec lacinia eu, euismod sit amet ligula."),

    // p005

    Comment(
        id: "cm012",
        userId: "u002",
        postId: "p005",
        dateGmt: DateTime(2021, 2, 9),
        content:
            "Aliquam mattis mattis semper. In ultrices eget nisi ac pharetra. Duis id nisl scelerisque urna vehicula molestie quis a arcu."),

    // p006

    Comment(
        id: "cm013",
        userId: "u001",
        postId: "p006",
        dateGmt: DateTime(2021, 4, 6),
        content:
            "Donec lectus dui, pulvinar a vehicula vel, blandit sed purus."),

    Comment(
        id: "cm014",
        userId: "u002",
        postId: "p006",
        dateGmt: DateTime(2021, 4, 9),
        content:
            "Pellentesque tincidunt semper purus, at porta nulla sodales quis. Morbi vitae erat arcu."),

    // p007

    Comment(
        id: "cm015",
        userId: "u002",
        postId: "p007",
        dateGmt: DateTime(2021, 1, 3),
        content:
            "Aliquam cursus enim eu hendrerit sodales. Vivamus luctus, tellus non tincidunt dapibus, mi neque ultricies ipsum, id venenatis ex arcu in lacus. In hac habitasse platea dictumst. Pellentesque lacus metus, ornare non feugiat vel, suscipit eget sapien. Duis convallis ornare odio non bibendum. Nunc hendrerit orci vel pharetra interdum."),

    Comment(
        id: "cm016",
        userId: "u001",
        postId: "p007",
        dateGmt: DateTime(2021, 2, 8),
        content:
            "Duis aliquam massa augue, vitae sollicitudin massa laoreet at. Suspendisse iaculis nisi et urna scelerisque, a lobortis lorem venenatis. In vitae libero cursus, viverra eros in, hendrerit justo."),

    Comment(
        id: "cm017",
        userId: "u002",
        postId: "p007",
        dateGmt: DateTime(2021, 6, 17),
        content:
            "Nunc suscipit orci ut sem mattis bibendum. Etiam viverra velit nec purus dictum, eget aliquam tellus posuere."),

    Comment(
        id: "cm018",
        userId: "u002",
        postId: "p007",
        dateGmt: DateTime(2021, 7, 29),
        content:
            "Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."),

    // p008

    Comment(
        id: "cm019",
        userId: "u002",
        postId: "p008",
        dateGmt: DateTime(2021, 3, 7),
        content:
            "Donec nec tempus nibh, eu cursus purus. Suspendisse tortor mauris, condimentum eget condimentum ultrices, venenatis at tortor. Phasellus lacinia rhoncus iaculis. Aenean vitae mauris pretium, volutpat sapien vitae, tincidunt purus. Praesent molestie ante id sapien mollis, eget tincidunt risus volutpat. In placerat risus erat. Integer ornare interdum nulla, et rutrum ligula blandit eget. Suspendisse ultricies nec ipsum at laoreet. Suspendisse mollis turpis vel ex bibendum congue. Nunc mollis elit eget ultricies dignissim."),

    Comment(
        id: "cm020",
        userId: "u001",
        postId: "p008",
        dateGmt: DateTime(2021, 4, 9),
        content:
            "Pellentesque mattis ullamcorper dui sit amet dictum. Aliquam et lobortis quam. Maecenas tincidunt ipsum eu cursus rhoncus."),

    // p009

    Comment(
        id: "cm021",
        userId: "u002",
        postId: "p009",
        dateGmt: DateTime(2021, 4, 21),
        content:
            "Nunc volutpat suscipit tortor eu pulvinar. Quisque bibendum molestie odio. Curabitur porta interdum est quis lacinia."),

    // p010

    Comment(
        id: "cm022",
        userId: "u002",
        postId: "p010",
        dateGmt: DateTime(2021, 4, 12),
        content:
            "In vitae lacus laoreet, aliquet metus ut, vulputate tellus. Integer sed mi eu libero semper viverra. Morbi sollicitudin risus nec elit posuere, faucibus fringilla ex condimentum. Etiam mauris turpis, ullamcorper ac ipsum at, tincidunt consequat neque. Vivamus vulputate mi nec sem aliquet vestibulum."),

    Comment(
        id: "cm001",
        userId: "u002",
        postId: "p010",
        dateGmt: DateTime(2021, 5, 15),
        content: "Duis efficitur dolor in enim interdum sodales."),

    Comment(
        id: "cm002",
        userId: "u001",
        postId: "p010",
        dateGmt: DateTime(2021, 6, 27),
        content:
            "Sed faucibus ipsum eget magna tempus, eu vestibulum velit sagittis. Donec tincidunt pellentesque lorem quis molestie. Fusce elementum orci ut odio dictum, quis posuere tellus ullamcorper."),

    // p011

    Comment(
        id: "cm003",
        userId: "u002",
        postId: "p011",
        dateGmt: DateTime(2021, 2, 21),
        content:
            "Suspendisse accumsan, tellus eu consequat ultrices, justo ex vulputate risus, id venenatis leo neque vel ipsum. Suspendisse velit ante, suscipit sit amet iaculis accumsan, posuere eget ex."),

    Comment(
        id: "cm004",
        userId: "u002",
        postId: "p011",
        dateGmt: DateTime(2021, 3, 18),
        content:
            "Etiam malesuada ultricies euismod. Sed odio mauris, tempor quis dapibus vitae, rutrum non massa."),

    // p012

    Comment(
        id: "cm005",
        userId: "u001",
        postId: "p012",
        dateGmt: DateTime(2021, 1, 25),
        content:
            "Maecenas laoreet, magna non congue fermentum, nisl risus varius nulla, et egestas urna ligula a diam. Nullam elementum ut nibh vel varius. Vivamus eros lectus, congue eget tellus in, aliquet sagittis leo. Praesent diam mauris, dapibus eu purus ut, dictum pretium odio. Sed ac aliquet sem."),

    Comment(
        id: "cm006",
        userId: "u002",
        postId: "p012",
        dateGmt: DateTime(2021, 2, 14),
        content:
            "Vestibulum aliquam eros fringilla lectus scelerisque tincidunt. Phasellus vel pellentesque odio, at auctor augue. In hac habitasse platea dictumst."),

    Comment(
        id: "cm007",
        userId: "u002",
        postId: "p012",
        dateGmt: DateTime(2021, 4, 27),
        content:
            "Curabitur at nisi vitae eros mattis imperdiet. Sed enim metus, sodales vel suscipit in, facilisis eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi lacinia sodales ex. Cras auctor sapien risus, egestas fringilla dolor finibus vitae. Pellentesque eu turpis non velit venenatis consequat a non eros."),

    // p013

    Comment(
        id: "cm008",
        userId: "u002",
        postId: "p013",
        dateGmt: DateTime(2021, 2, 9),
        content:
            "Ut in est vitae nibh imperdiet eleifend. In hendrerit placerat dignissim. Mauris eleifend augue eget risus accumsan sodales. Proin posuere justo a metus mattis sagittis. Quisque vel bibendum metus. Integer ac ipsum venenatis, posuere turpis eu, aliquet magna. Nullam nec nisl auctor, efficitur est ut, gravida diam. Praesent auctor, sem sit amet sagittis tincidunt, leo nulla cursus sem, semper tempor urna sem pellentesque odio."),

    Comment(
        id: "cm009",
        userId: "u001",
        postId: "p013",
        dateGmt: DateTime(2021, 5, 18),
        content:
            "Proin dictum sem justo, quis ultricies ante iaculis et. Maecenas rutrum tempus tellus ut vestibulum. Suspendisse imperdiet imperdiet odio, a ornare ligula feugiat egestas."),

    // p014

    Comment(
        id: "cm010",
        userId: "u002",
        postId: "p014",
        dateGmt: DateTime(2021, 6, 3),
        content:
            "Quisque mollis semper eros non hendrerit. Curabitur non lacus dolor. Aenean sit amet urna sed erat dapibus gravida et et justo."),

    Comment(
        id: "cm011",
        userId: "u002",
        postId: "p014",
        dateGmt: DateTime(2021, 8, 19),
        content:
            "Nunc venenatis, ante ac fermentum luctus, ligula ligula semper enim, quis commodo mi erat ac massa. Donec ornare arcu a tortor commodo mattis. Phasellus a justo id purus ornare iaculis."),

    // p015

    Comment(
        id: "cm012",
        userId: "u002",
        postId: "p015",
        dateGmt: DateTime(2021, 4, 6),
        content:
            "Vestibulum et laoreet ipsum, at scelerisque velit. Suspendisse quis ipsum quam. Pellentesque in ligula mi. Mauris eget accumsan turpis. Mauris ultrices sollicitudin ultrices."),

    // p016

    Comment(
        id: "cm013",
        userId: "u001",
        postId: "p016",
        dateGmt: DateTime(2021, 5, 29),
        content:
            "Etiam imperdiet neque in urna ullamcorper, eu tincidunt risus vestibulum. Integer aliquet at eros ut posuere. Suspendisse gravida, ante non aliquet venenatis, ex urna sodales leo, quis fermentum metus purus sed nunc."),

    Comment(
        id: "cm014",
        userId: "u002",
        postId: "p016",
        dateGmt: DateTime(2021, 6, 13),
        content:
            "Integer sagittis, sem varius gravida semper, est neque lacinia nisl, sit amet sagittis nisi mauris nec neque. Mauris efficitur sed nisl vitae aliquet."),

    // p017

    Comment(
        id: "cm015",
        userId: "u002",
        postId: "p017",
        dateGmt: DateTime(2021, 2, 16),
        content:
            "Nulla eu neque at purus tempus rhoncus. Praesent eget pellentesque turpis."),

    Comment(
        id: "cm016",
        userId: "u001",
        postId: "p017",
        dateGmt: DateTime(2021, 4, 23),
        content:
            "Nunc ac congue risus, a pellentesque lorem. Aliquam vel dignissim diam, et ultricies est. Cras vulputate est ut libero ornare suscipit."),

    Comment(
        id: "cm017",
        userId: "u002",
        postId: "p017",
        dateGmt: DateTime(2021, 4, 24),
        content:
            "Morbi scelerisque non tortor nec ultricies. Curabitur quis facilisis nunc, non imperdiet enim. Vivamus vehicula urna mauris, bibendum lacinia eros congue eu."),

    Comment(
        id: "cm018",
        userId: "u002",
        postId: "p017",
        dateGmt: DateTime(2021, 5, 4),
        content:
            "In vestibulum magna vel aliquam auctor. Etiam varius eros eget lorem porttitor pharetra. Nunc nec felis felis. Curabitur ut ante sit amet lorem posuere semper in vitae elit."),

    // p018

    Comment(
        id: "cm019",
        userId: "u002",
        postId: "p018",
        dateGmt: DateTime(2021, 5, 11),
        content:
            "Integer luctus ante sem, id semper nisi aliquam faucibus. Fusce a nibh sapien."),

    Comment(
        id: "cm020",
        userId: "u001",
        postId: "p018",
        dateGmt: DateTime(2021, 7, 18),
        content:
            "Donec lectus ante, gravida ac velit eu, vestibulum luctus metus. Duis eleifend eleifend augue eu lobortis. Aenean ligula velit, dignissim nec rutrum quis, egestas fringilla tellus."),

    // p019

    Comment(
        id: "cm021",
        userId: "u002",
        postId: "p019",
        dateGmt: DateTime(2021, 3, 20),
        content:
            "Sed diam ante, laoreet eu ultrices eu, hendrerit sed ex. Morbi bibendum fringilla nibh luctus aliquam. Nam sit amet ligula non nulla suscipit elementum sit amet vitae nisl. Nulla ornare convallis venenatis. Vivamus dictum sapien id diam scelerisque convallis. In eu nisi in lacus egestas feugiat."),

    // p020

    Comment(
        id: "cm022",
        userId: "u002",
        postId: "p020",
        dateGmt: DateTime(2021, 5, 31),
        content:
            "Nullam lacinia auctor arcu quis congue. Proin eget urna a risus convallis ullamcorper. Pellentesque venenatis, sapien malesuada blandit posuere, velit nisi faucibus augue, vel faucibus nulla lectus maximus ex."),

    // p021

    Comment(
        id: "cm023",
        userId: "u002",
        postId: "p021",
        dateGmt: DateTime(2021, 1, 30),
        content:
            "Maecenas sit amet ante nisi. Vestibulum tristique in dolor eget accumsan. Nullam nisi orci, auctor vitae hendrerit non, scelerisque vulputate ante. Curabitur tempus turpis et est dignissim, eget vulputate eros convallis."),

    Comment(
        id: "cm024",
        userId: "u002",
        postId: "p021",
        dateGmt: DateTime(2021, 1, 31),
        content: "Curabitur sed enim quis felis lobortis posuere. "),

    Comment(
        id: "cm025",
        userId: "u001",
        postId: "p021",
        dateGmt: DateTime(2021, 4, 14),
        content:
            "Aliquam non semper enim. Ut a porttitor tellus, id dapibus risus. Vestibulum sed mauris dictum, luctus est et, elementum augue. Donec blandit consectetur tellus ac tempus. Ut imperdiet, sem vitae mattis viverra, augue nisl sollicitudin ligula, posuere finibus lectus mi et ex. Sed dignissim sem at pulvinar porttitor."),

    Comment(
        id: "cm026",
        userId: "u002",
        postId: "p021",
        dateGmt: DateTime(2021, 5, 9),
        content:
            "Donec imperdiet elit nulla, vel pharetra erat malesuada quis. Cras ultricies vulputate rutrum. Aliquam erat volutpat. Ut sit amet molestie odio. Etiam vel neque risus. Nam vel libero vel lacus congue suscipit ac at erat"),

    // p022

    Comment(
        id: "cm027",
        userId: "u002",
        postId: "p022",
        dateGmt: DateTime(2021, 3, 29),
        content:
            "Donec porttitor, neque sit amet sagittis aliquet, ipsum odio porttitor magna, finibus sagittis nisl libero at dolor. Curabitur maximus, ipsum vel finibus dictum, sem leo lobortis erat, vitae vulputate nisl lacus vel sem. Aenean lorem neque, efficitur at erat vitae, varius rhoncus mi. Aliquam id ullamcorper nibh. Suspendisse quam turpis, pellentesque et blandit non, pellentesque eu libero."),

    Comment(
        id: "cm028",
        userId: "u002",
        postId: "p022",
        dateGmt: DateTime(2021, 6, 18),
        content:
            "Nam quis suscipit enim. Suspendisse accumsan congue placerat. Aliquam erat volutpat. Quisque fermentum scelerisque dictum. Proin semper urna erat, sit amet semper est blandit non."),

    // p023

    Comment(
        id: "cm029",
        userId: "u001",
        postId: "p023",
        dateGmt: DateTime(2021, 2, 20),
        content:
            "Cras imperdiet vitae mi sit amet varius. Nam ac ultricies nisi. Donec sed orci aliquam, blandit lectus non, blandit lectus. Sed fermentum porttitor ligula non condimentum."),

    // p024

    Comment(
        id: "cm030",
        userId: "u002",
        postId: "p024",
        dateGmt: DateTime(2021, 1, 13),
        content:
            "Ut eget odio vitae justo auctor tincidunt molestie et lacus. Phasellus vestibulum malesuada ullamcorper."),

    Comment(
        id: "cm031",
        userId: "u002",
        postId: "p024",
        dateGmt: DateTime(2021, 4, 30),
        content:
            "Praesent sit amet faucibus enim. Donec vestibulum non felis sed bibendum."),

    // p025

    Comment(
        id: "cm032",
        userId: "u002",
        postId: "p025",
        dateGmt: DateTime(2021, 2, 9),
        content:
            "Etiam facilisis leo id ante vestibulum, sit amet fringilla turpis eleifend. Integer efficitur commodo erat id tempor"),

    Comment(
        id: "cm033",
        userId: "u001",
        postId: "p025",
        dateGmt: DateTime(2021, 3, 1),
        content: "Curabitur vel eros vitae dolor eleifend imperdiet."),

    Comment(
        id: "cm034",
        userId: "u002",
        postId: "p025",
        dateGmt: DateTime(2021, 5, 18),
        content:
            "Nulla ut congue odio, ac volutpat odio. Ut efficitur mauris urna, nec sollicitudin nulla viverra nec. Praesent ut suscipit erat. Etiam sodales fermentum est, eu tincidunt libero. In orci quam, sagittis ac mattis at, suscipit vel ex."),

    // p026

    Comment(
        id: "cm035",
        userId: "u002",
        postId: "p026",
        dateGmt: DateTime(2021, 1, 2),
        content:
            "Nulla maximus urna at ex dictum posuere. Etiam elit quam, convallis non dolor vitae, feugiat vulputate est."),

    Comment(
        id: "cm036",
        userId: "u001",
        postId: "p026",
        dateGmt: DateTime(2021, 3, 19),
        content:
            "Vestibulum viverra fringilla dolor, sed sollicitudin orci tempus id. Praesent eu feugiat arcu."),

    Comment(
        id: "cm037",
        userId: "u002",
        postId: "p026",
        dateGmt: DateTime(2021, 5, 11),
        content:
            "Aenean facilisis mi felis, sed bibendum felis volutpat at. Maecenas bibendum nisl sed blandit dictum."),

    Comment(
        id: "cm038",
        userId: "u002",
        postId: "p026",
        dateGmt: DateTime(2021, 6, 28),
        content:
            "Nulla gravida, orci et porttitor tincidunt, neque ipsum gravida odio, at tempus neque augue ut metus. Curabitur pellentesque, nisl elementum fermentum euismod, purus diam cursus ante, sed mollis enim erat in mi. Aenean vitae rhoncus ipsum. Fusce quis lacus non lacus dictum aliquet."),

    // p027

    Comment(
        id: "cm039",
        userId: "u002",
        postId: "p027",
        dateGmt: DateTime(2021, 3, 19),
        content:
            "Integer sit amet ultricies sapien, lobortis faucibus ligula."),

    Comment(
        id: "cm040",
        userId: "u001",
        postId: "p027",
        dateGmt: DateTime(2021, 5, 29),
        content:
            "Vestibulum vel nunc et mi accumsan convallis sit amet et augue."),

    // p028

    Comment(
        id: "cm041",
        userId: "u002",
        postId: "p028",
        dateGmt: DateTime(2021, 4, 10),
        content:
            "In blandit mauris sed tempor porta. In suscipit faucibus vulputate. Sed quam magna, vulputate aliquet quam tempus, volutpat aliquet quam. Fusce cursus libero sed diam condimentum aliquam. Duis vel dolor enim. Nam scelerisque nulla vitae augue feugiat consequat. Cras tellus quam, tincidunt vel justo at, lobortis elementum diam. Mauris in ultrices est, placerat egestas augue. Mauris et risus mauris. Suspendisse vehicula, justo rutrum congue feugiat, nisl nisi sollicitudin nulla, ultricies rutrum sapien nisi at ligula."),

    Comment(
        id: "cm042",
        userId: "u002",
        postId: "p028",
        dateGmt: DateTime(2021, 6, 9),
        content:
            "Donec quis risus justo. Morbi mauris libero, tempus sollicitudin mi eget, scelerisque porttitor nunc. Sed condimentum enim at egestas volutpat."),
  ];
}
