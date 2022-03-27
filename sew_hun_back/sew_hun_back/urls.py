from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include
from drf_yasg import openapi
from drf_yasg.views import get_schema_view
from rest_framework import permissions
from rest_framework.authtoken import views

schema_view = get_schema_view(
    openapi.Info(
        title="Snippets API",
        default_version='v1',
        description="Test description",
        terms_of_service="https://www.google.com/policies/terms/",
        contact=openapi.Contact(email="contact@snippets.local"),
        license=openapi.License(name="BSD License"),
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
)

admin.site.site_header = 'Sew Hun Kesewm Sew Hun'
admin.site.site_title = 'GeeksForGeeks'
admin.site.index_title = 'GeeksForGeeks Administration'

urlpatterns = [
                  path('', include('pages.urls')),
                  path('admin/', admin.site.urls),
                  path('account/', include('accounts.urls'), ),

                  path('auth/', include('dj_rest_auth.urls'), ),
                  path('auth/registration/', include('dj_rest_auth.registration.urls'), ),

                  path('blog/', include('blog.urls'), ),

                  path('chat/', include('chat.urls'), ),

                  path('docs/', schema_view.with_ui('swagger', cache_timeout=0), name='docs'),

              ] + static(
    settings.MEDIA_URL,
    document_root=settings.MEDIA_ROOT
)
