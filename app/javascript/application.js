// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";

import {
  createIcons,
  Menu,
  ArrowRight,
  Globe,
  LayoutDashboard,
  Users,
} from "lucide";

createIcons({
  icons: {
    Menu,
    ArrowRight,
    Globe,
    LayoutDashboard,
    Users,
  },
});
