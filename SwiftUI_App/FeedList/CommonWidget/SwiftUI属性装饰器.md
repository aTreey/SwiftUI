#  属性装饰器

### @State
用于 View 中的私有状态值，一般来说它所修饰的都应该是 struct 值，并且不应该被其他的 view 看到,用来描述视图的状态，被修饰的变量被存储在视图结构以外的特殊内存中，只有相关视图才能访问它，一旦属性发生变化，swiftUI 就会重新渲染UI

### @Binding
用来为值类型的属性提供引用类型的访问，通过 @Binding修饰器修饰后，属性变成了一个引用类型，传递变成了引用传递，这样父子视图的状态就能关联起来了，使用时用 $ 来取值

### @ObservedObject
用于更复杂的一组状态，我们可以将它组织在一个 class 中，并让其实现 ObservableObject 协议。对于这样的 class 类型，其中被标记为 @Published 的属性，将会在变更时自动发出事件，通知对它有依赖的 View 进行更新。View 中如果需要依赖这样的 ObservableObject 对象，在声明时则使用 @ObservedObject 来订阅 ，@ObservedObject不管存储，会随着 View 的创建被多次创建
用来处理SwiftUI之外的数据，比如业务逻辑。可在多视图之间共享，视图可订阅该对象，一旦出现更改，SwiftUI就会重建绑定到此对象的所有视图

#### @Published
用 @ObservedObject 来修饰的对象，属性要用 @Published 修饰才能被SwiftUI 监听


### @EnvironmentObject
@EnvironmentObject 针对那些需要传递到深层次的子 View 中的 ObservableObject 对象，我们可以在父层级的 View 上用 .environmentObject 修饰器来将它注入到环境中，这样任意子 View 都可以通过@EnvironmentObject访问，避免通过视图的init方法传递observeObject，将它隐式地注入到视图层次结构的环境中，可让所有子视图机会访问这个observeobject


### @Environment
访问系统的环境变量


@ObservedObject 不管存储，会随着 View 的创建被多次创建。而 @StateObject 保证对象只会被创建一次。因此，如果是在 View 里自行创建的 ObservableObject model 对象，大概率来说使用 @StateObject 会是更正确的选择。@StateObject 基本上来说就是一个针对 class 的 @State 升级版。

...

    @Environment(\.calendar) var calendar: Calendar
    @Environment(\.locale) var locale: Locale
    @Environment(\.colorScheme) var colorScheme: ColorScheme
....


