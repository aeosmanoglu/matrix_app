# Matrix Flutter App

A new instant messaging Flutter application.

## Geliştirme Politikası

1. **Sistem özelden genele doğru tasarlanacak:** Tüm kurum personelinin mesajlaşması için değil, sadece küçük bir kesimin sorunsuz bir şekilde kullanabilmesi için tasarlanacak.
1. **Sisteme özellik kısıtlamaları sonradan eklenecek:** Kimin kimle konuşup konuşamayacağı, grup kurup kuramayacağı gibi kısıtlamalar olmayacak. Gerekirse sonradan eklenecek.
1. **Öncelikle en temel ihtiyaçlara cevap verecek:** Güvenli mesajlaşma. Sistem önce metin mesajı gönderecek sonra bunu anlık olarak sağlayacak. Eklenti gönderme ve görüntülü görüşme daha sonra sırayla eklenecek.
1. **Uygulamalar Dart ve Flutter SDK ile geliştirilecek:** SDK desteklediği sürece iOS, Android, macOS, Windows, browser uygulamaları olacak. 
1. **Sade ve basit olacak:** Hem arayüzde hem de kodlamanın genelinde. Gereksiz tüm özelleştirmeler ve kodlamalardan kaçınılacak.

## Kaynaklar

1. [Client-Server API](https://matrix.org/docs/spec/client_server/r0.6.0)
1. [Synapse](https://github.com/matrix-org/synapse)
1. [Synapse LDAP Provider](https://github.com/matrix-org/matrix-synapse-ldap3)
1. [Sygnal](https://github.com/matrix-org/sygnal)
1. [Logo fikri](https://dribbble.com/shots/10859189-Cute-Minimal-Bird)

## Yapılacaklar

- [x] Synapse sunucu kurulumu
- [x] LDAP AD entegrasyonu
  1. `/env/lib/python3.7/site-packages/synapse/handlers/register.py` dosyasında aşağıdaki kod parçası comment edildi.

  ```python
  if not was_guest:
    try:
      int(localpart)
      raise SynapseError(
        400, "Numeric user IDs are reserved for guest users."
      )
    except ValueError:
    pass
  ```

- [x] 0.1.0 Login
  - [x] Login
  - [x] Logout
- [x] 0.2.0 Find Users
  1. `homeserver.yaml` dosyasındaki aşağıdaki kod parçası uncomment edildi. `search_all_users: true` olarak düzeltildi.
  
  ```yaml
  user_directory:
    enabled: true
    search_all_users: true
  ```

  2. `homeserver.db` dosyasında aşağıdaki kodlar execute edildi.

  ```sql
  -- Set up staging tables
  INSERT INTO background_updates (update_name, progress_json) VALUES
      ('populate_user_directory_createtables', '{}');
  
  -- Run through each room and update the user directory according to who is in it
  INSERT INTO background_updates (update_name, progress_json, depends_on) VALUES
      ('populate_user_directory_process_rooms', '{}', 'populate_user_directory_createtables');
  
  -- Insert all users, if search_all_users is on
  INSERT INTO background_updates (update_name, progress_json, depends_on) VALUES
      ('populate_user_directory_process_users', '{}', 'populate_user_directory_process_rooms');
  
  -- Clean up staging tables
  INSERT INTO background_updates (update_name, progress_json, depends_on) VALUES
      ('populate_user_directory_cleanup', '{}', 'populate_user_directory_process_users');
  ```
  
  3. Sunucu kapatılıp tekrar açıldı. Restart çalışmadı.
- [ ] 0.2.0 Create room
- [ ] 0.3.0 Send Recieve text messages
- [ ] 0.4.0 Push notification
- [ ] Sunucu ve iletişim güvenliği
- [x] 1.0.0 Logo
