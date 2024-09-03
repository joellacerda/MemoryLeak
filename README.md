Um memory leak ocorre quando a memória alocada por uma aplicação não é liberada mesmo quando não é mais necessária, 
resultando em uso excessivo de memória e potencialmente levando à queda de performance ou travamentos. 
Em SwiftUI, memory leaks podem acontecer principalmente devido a referências circulares entre objetos, onde dois ou mais 
objetos mantêm fortes referências entre si, impedindo que o ARC (Automatic Reference Counting) consiga liberar a memória.

---

### Explicação do Código:

1. **LeakViewModel:**
   - `LeakViewModel` é um `ObservableObject` que contém uma referência à `ContentView` através da variável `view`.

2. **ContentView:**
   - `ContentView` cria uma instância de `LeakViewModel` usando `@StateObject`, garantindo que o ciclo de vida do `ViewModel` seja gerenciado pela View.
   - Quando a `ContentView` aparece na tela (`onAppear`), ela atribui a si mesma (`self`) à propriedade `view` do `LeakViewModel`, criando uma referência circular.

3. **LeakyDetailView:**
   - `LeakyDetailView` recebe o `LeakViewModel` via `@ObservedObject`, o que significa que ele mantém uma forte referência ao ViewModel, mas não ao contrário.

### Como a POC Cria um Memory Leak:

- A `ContentView` mantém uma referência forte ao `LeakViewModel`.
- O `LeakViewModel` mantém uma referência forte à `ContentView`.
- Mesmo depois que a `LeakyDetailView` desaparece (ao navegar de volta), essa referência circular impede que o ARC desalocar a memória, criando um memory leak.

### Como Verificar o Memory Leak:

- Execute o app e navegue para a `LeakyDetailView` e depois volte para a `ContentView`.
- No console, você verá que a mensagem `LeakViewModel foi desalocado` não aparece, indicando que o `LeakViewModel` não foi desalocado, caracterizando o memory leak.

### Como Resolver:

- Remover a referência circular, por exemplo, tornando a referência `view` do `LeakViewModel` uma `weak var` ou reestruturando o código para evitar essa dependência circular.
