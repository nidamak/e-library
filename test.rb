require 'minitest/autorun'

class TestLibrary < Minitest::Test
  # Тест на бронирование книги
  def test_book_reservation
    # Имитируем базу данных книг
    available_books = {
      "Гарри Поттер" => 3,  # 3 экзeмпляра в наличии
      "1984" => 1,
      "Война и мир" => 0     # Нет в наличии  
    }

    # Пытаемся забронировать книгу
    book_title = "1984"
    initial_copies = available_books[book_title]
    
    if initial_copies > 0
      available_books[book_title] -= 1  # Уменьшаем количество
      reservation_success = true
    else
      reservation_success = false
    end

    # Проверяем результат
    assert reservation_success, "Книга '#{book_title}' должна быть доступна для брони"
    assert_equal 0, available_books[book_title], "Количество экземпляров должно уменьшиться"
  end

  # Тест на попытку бронирования отсутствующей книги
  def test_failed_reservation
    available_books = { "Война и мир" => 0 }
    reservation_success = available_books["Война и мир"] > 0
    refute reservation_success, "Нельзя забронировать отсутствующую книгу"
  end
end