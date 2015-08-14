package gimmekey

import  (
    "testing"
)

func BenchmarkConsulz(b *testing.B) {
    for i := 0; i < b.N; i++ {
        getkey()
    }
}
