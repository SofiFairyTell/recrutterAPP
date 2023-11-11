import csv
from redminelib import Redmine
api_key = 'de1b88738e2a19ec994caf6f88d4581d6edd16bb'
# Замените 'https://your-redmine-instance.com' и 'your_api_key' на ваши реальные значения
redmine = Redmine('https://dev.sciener.ru', key=api_key)

# Теперь можно получить проекты и вывести их информацию
issues = redmine.issue.all()
# Записываем информацию о задачах в CSV-файл

# Записываем информацию о задачах и их подзадачах/связанных задачах в CSV-файл
with open('tasks_info.csv', mode='w', newline='', encoding='utf-8') as csvfile:
    # Задаем заголовки CSV-файла
    fieldnames = ['Issue ID', 'Subject', 'Project', 'Subtasks', 'Subtasks ID', 'Stage']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    # Записываем заголовки в CSV-файл
    writer.writeheader()

    # Записываем информацию о каждой задаче и её подзадачах/связанных задачах в CSV-файл
    for issue in issues:
        subtasks = ', '.join([subtask.subject for subtask in issue.children])
        subtasksid = ', '.join([str(subtask.id) for subtask in issue.children]) if issue.children else ''
        # Получаем все кастомные поля
        try:
            # Пытаемся получить значение атрибута custom_fields, если он доступен
            custom_fields = issue.to_dict().get('custom_fields', [])
        except AttributeError:
            # Если атрибут недоступен, присваиваем пустой список
            custom_fields = []
        # Проверяем, есть ли кастомное поле с указанным идентификатором (предполагаем, что идентификатор поля - 18)
        stage_field = next((cf for cf in custom_fields if cf.name == 'Этап'), None)

        # Если поле существует, получаем его значение, в противном случае присваиваем None
        stage_value = stage_field.value if stage_field else None

        writer.writerow({'Issue ID': issue.id, 'Subject': issue.subject, 'Project': issue.project.name, 'Subtasks': subtasks, 'Subtasks ID': subtasksid, 'Stage': stage_value})