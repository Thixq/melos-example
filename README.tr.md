# 📦 Melos Monorepo Boilerplate

*Read this in [English](README.md).*

Bu proje, Dart ve Flutter ekosisteminde büyük ölçekli uygulamaları yönetmek için **Melos (v7)** kullanılarak hazırlanmış, kurumsal standartlarda bir monorepo mimarisi iskeletidir (boilerplate). 

Geleneksel `melos.yaml` yerine tüm yapılandırma ana dizindeki `pubspec.yaml` üzerinden yönetilmektedir ve izole SDK yönetimi için **FVM (Flutter Version Management)** entegrasyonuna sahiptir.

## ✨ Temel Yetenekler (Senaryolar)

Bu mimari, CI/CD (Sürekli Entegrasyon) süreçlerindeki maliyetleri ve zaman kaybını en aza indirmek için 3 temel akıllı senaryo üzerine inşa edilmiştir:

### 1. Otonom Fabrika (Otomatik Kod Üretimi)
Yeni bir geliştirici projeyi klonlayıp `melos bootstrap` komutunu çalıştırdığında, sistem arka planda akıllıca çalışır. Sadece `pubspec.yaml` dosyasında `build_runner` bağımlılığı bulunan paketleri bulur ve o paketler için otomatik olarak kod üretimini (`.g.dart`, `.freezed.dart`) başlatır.

### 2. Akıllı Cerrahi Müdahale (Filtreli Testler)
Monorepolarda ufak bir değişiklik için tüm paketleri test etmek büyük bir zaman israfıdır. Projeye eklenen **Smart Test** betiği sayesinde, sadece üzerinde çalıştığınız (dosyası değişen) paketler ve onlara bağımlı olan üst paketler bulunarak test edilir. Hata anında süreç hemen durdurulur (`--fail-fast`).

### 3. Sürüm Orkestratörü (Otomatik Versiyonlama & Changelog)
Projedeki sürüm numaraları manuel olarak değiştirilmez. Geliştiriciler `feat:`, `fix:`, `chore:` gibi [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) standartlarında mesaj atar. `melos version` komutu bu Git geçmişini okuyarak paketlerin (Örn: `user_api`) Minör veya Majör sürümlerini otomatik günceller, etiketler (tag) atar ve tıklanabilir GitHub commit linklerine sahip profesyonel bir `CHANGELOG.md` üretir.

---

## 🚀 Başlangıç ve Kurulum

Projeyi bilgisayarınıza klonladıktan sonra şu adımları izleyin:

**1. FVM ile Flutter SDK'yı hazırlayın:**
```bash
fvm install

```

**2. Melos'u global olarak aktif edin (Eğer yüklü değilse):**

```bash
dart pub global activate melos

```

**3. Çalışma alanını (Workspace) senkronize edin:**

```bash
melos bootstrap

```

*(Bu komut tüm paketlerin bağımlılıklarını indirecek ve `post` hook sayesinde gerekli paketlerde otomatik kod üretecektir.)*

---

## 🛠️ Kullanılabilir Komutlar

Melos için ana `pubspec.yaml` dosyasına eklenmiş özel komutları aşağıdaki gibi kullanabilirsiniz:

| Komut | Açıklama |
| --- | --- |
| `melos bootstrap` | Tüm çalışma alanını kurar, paketleri bağlar ve otonom kod üretimini tetikler. |
| `melos run test:smart` | Yalnızca Git geçmişinde `main` branch'ine göre değişmiş olan ve o değişen paketi kullanan bağımlı paketlerin testlerini çalıştırır. |
| `melos version` | Git loglarını analiz ederek otomatik sürüm (SemVer) artırır ve linkli `CHANGELOG.md` oluşturur. |

---

## 📁 Proje Yapısı

```text
melos-example/
├── .fvmrc                 # FVM (Flutter Version Management) yapılandırması
├── pubspec.yaml           # Melos Workspace ayarları ve ana konfigürasyon
├── packages/              # Monorepo içindeki modüller / paketler
│   ├── user_api/          # Örnek Dart Paketi (json_serializable ile kod üretimi ve test örneği)

```

## 🤝 Katkıda Bulunma

Sürüm yönetimi için lütfen commit mesajlarınızı **Conventional Commits** standartlarına göre atın. Aksi takdirde `melos version` komutu sürüm notlarını doğru üretemeyecektir.

* **feat:** Yeni bir özellik
* **fix:** Hata düzeltmesi
* **docs:** Dokümantasyon değişiklikleri
* **chore:** Altyapı/paket güncellemeleri

---

*Bu mimari, modern monorepo standartlarını öğrenmek ve uygulamak amacıyla Kaan EFE (@Thixq) tarafından geliştirilmiştir.*
