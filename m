Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C8C8B898
	for <lists+cocci@lfdr.de>; Tue, 13 Aug 2019 14:32:56 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7DCWNm3020203;
	Tue, 13 Aug 2019 14:32:23 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1088777A2;
	Tue, 13 Aug 2019 14:32:20 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id AFB5D7778
 for <cocci@systeme.lip6.fr>; Tue, 13 Aug 2019 14:21:04 +0200 (CEST)
Received: from mail-yw1-f74.google.com (mail-yw1-f74.google.com
 [209.85.161.74])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7DCL0cM003817
 for <cocci@systeme.lip6.fr>; Tue, 13 Aug 2019 14:21:00 +0200 (CEST)
Received: by mail-yw1-f74.google.com with SMTP id h22so989074ywk.15
 for <cocci@systeme.lip6.fr>; Tue, 13 Aug 2019 05:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=V8gq4FEcRvbLdxBlRa7vcpMivgfsfciaemI15mBExE8=;
 b=J1JvF9/Z2E6HEZY+TmZUofDtVpYqdI1Gnm5upd1bRhepBQzP/0MOpUPhjTBa0sK1bM
 yPiLYl6iRvUCayu7p3gxzbDp9sNZcaCx3ab05pTSvMrczZoI6YXlQ3U0IcDE+357J3RY
 X9C1DD66+0XqJtZL8LLihrPhx8E5Z+d6wM3Do8UJKi0SZcCvM/F15c3S9YTT9nnBHd8j
 7W2frWldzYDzmJ9mvUrVRWR0McsxOSpeRfhYE7aUsQh05GTfldzSRbCt9ZIKakJPt2rI
 y0ElaN01C1QUNthrkdCq3dRAle2h0mWBfFDiGrVl44lhapY7B2M2bn1Z11MjBOmKOpHc
 h36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=V8gq4FEcRvbLdxBlRa7vcpMivgfsfciaemI15mBExE8=;
 b=m0ZrMV7MRWSvSdGTOEpQkWg6mDmfs1GR1hAjxUwpkPmOW/VYXayXo49dfWyfPJcyM8
 tHXmtETfmIcWF5Vevj241S63+1EjCR1xtsjIZcSi3oUTTy065ZGqBZS2c6igko2245jk
 PZyDtkNQyyIPo6+5RgRCm7gvjU7DjYN70YES4Fk1fspPsFv5U0OvpObEHBJhJtGmv9pc
 b00BXN/dzmjLVU5tmJRDTsoaYDy79j+nQdRcM98s9irHP8gn3yn/Gz7stclFixSfGKc0
 8/awoiZHR6JKonepxBfkOE0tW8MGG4vIpUzVQrn6zL5yBMWUi7EKWW1v6gncngiuG49I
 UQ/w==
X-Gm-Message-State: APjAAAVnNN2EyLumsVdyZKjhcNQR5ZjUj/11f1UCO1HntsCf6rMHYEHV
 vlVOUFPIXaU5z7z2561ocl9xgOABMW6E+w==
X-Google-Smtp-Source: APXvYqzr+R60HKCBq8zqAVf9WoLkTltvWJTiXGuyjp0hn9fOEPZm43SVcLRaZeRrtkZ9UoKqq+lU4fJ2FxAweA==
X-Received: by 2002:a25:dc49:: with SMTP id y70mr24281522ybe.334.1565698793774; 
 Tue, 13 Aug 2019 05:19:53 -0700 (PDT)
Date: Tue, 13 Aug 2019 13:17:05 +0100
In-Reply-To: <20190813121733.52480-1-maennich@google.com>
Message-Id: <20190813121733.52480-9-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com>
 <20190813121733.52480-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
From: Matthias Maennich <maennich@google.com>
To: linux-kernel@vger.kernel.org, maco@android.com
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 13 Aug 2019 14:32:34 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 13 Aug 2019 14:21:00 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Tue, 13 Aug 2019 14:32:18 +0200
Cc: kstewart@linuxfoundation.org, linux-m68k@vger.kernel.org, oneukum@suse.com,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        usb-storage@lists.one-eyed-alien.net, hpa@zytor.com,
        joel@joelfernandes.org, sam@ravnborg.org, cocci@systeme.lip6.fr,
        linux-arch@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
        lucas.de.marchi@gmail.com, mingo@redhat.com, geert@linux-m68k.org,
        stern@rowland.harvard.edu, kernel-team@android.com, sspatil@google.com,
        arnd@arndb.de, linux-kbuild@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>, jeyu@kernel.org,
        maennich@google.com, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        tglx@linutronix.de, michal.lkml@markovi.net,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        sboyd@codeaurora.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
        maco@google.com, pombredanne@nexb.com,
        "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Subject: [Cocci] [PATCH v2 08/10] scripts: Coccinelle script for namespace
	dependencies.
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

A script that uses the '<module>.ns_deps' file generated by modpost to
automatically add the required symbol namespace dependencies to each
module.

Usage:
1) Move some symbols to a namespace with EXPORT_SYMBOL_NS() or define
   DEFAULT_SYMBOL_NAMESPACE
2) Run 'make' (or 'make modules') and get warnings about modules not
   importing that namespace.
3) Run 'make nsdeps' to automatically add required import statements
   to said modules.

This makes it easer for subsystem maintainers to introduce and maintain
symbol namespaces into their codebase.

Co-developed-by: Martijn Coenen <maco@android.com>
Signed-off-by: Martijn Coenen <maco@android.com>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 MAINTAINERS                                 |  5 ++
 Makefile                                    | 12 +++++
 scripts/Makefile.modpost                    |  4 +-
 scripts/coccinelle/misc/add_namespace.cocci | 23 +++++++++
 scripts/nsdeps                              | 54 +++++++++++++++++++++
 5 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 scripts/coccinelle/misc/add_namespace.cocci
 create mode 100644 scripts/nsdeps

diff --git a/MAINTAINERS b/MAINTAINERS
index e81e60bd7c26..aa169070a052 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11414,6 +11414,11 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git
 F:	tools/include/nolibc/
 
+NSDEPS
+M:	Matthias Maennich <maennich@google.com>
+S:	Maintained
+F:	scripts/nsdeps
+
 NTB AMD DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	linux-ntb@googlegroups.com
diff --git a/Makefile b/Makefile
index 1b23f95db176..c5c3356e133c 100644
--- a/Makefile
+++ b/Makefile
@@ -1500,6 +1500,9 @@ help:
 	@echo  '  headerdep       - Detect inclusion cycles in headers'
 	@echo  '  coccicheck      - Check with Coccinelle'
 	@echo  ''
+	@echo  'Tools:'
+	@echo  '  nsdeps          - Generate missing symbol namespace dependencies'
+	@echo  ''
 	@echo  'Kernel selftest:'
 	@echo  '  kselftest       - Build and run kernel selftest (run as root)'
 	@echo  '                    Build, install, and boot kernel before'
@@ -1687,6 +1690,15 @@ quiet_cmd_tags = GEN     $@
 tags TAGS cscope gtags: FORCE
 	$(call cmd,tags)
 
+# Script to generate missing namespace dependencies
+# ---------------------------------------------------------------------------
+
+PHONY += nsdeps
+
+nsdeps:
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost nsdeps
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/$@
+
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 26e6574ecd08..743fe3a2e885 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -56,7 +56,8 @@ MODPOST = scripts/mod/modpost						\
 	$(if $(KBUILD_EXTMOD),$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS)))	\
 	$(if $(KBUILD_EXTMOD),-o $(modulesymfile))			\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)			\
-	$(if $(KBUILD_MODPOST_WARN),-w)
+	$(if $(KBUILD_MODPOST_WARN),-w)					\
+	$(if $(filter nsdeps,$(MAKECMDGOALS)),-d)
 
 ifdef MODPOST_VMLINUX
 
@@ -134,6 +135,7 @@ $(modules): %.ko :%.o %.mod.o FORCE
 
 targets += $(modules)
 
+nsdeps: __modpost
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
diff --git a/scripts/coccinelle/misc/add_namespace.cocci b/scripts/coccinelle/misc/add_namespace.cocci
new file mode 100644
index 000000000000..c832bb6445a8
--- /dev/null
+++ b/scripts/coccinelle/misc/add_namespace.cocci
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+/// Adds missing MODULE_IMPORT_NS statements to source files
+///
+/// This script is usually called from scripts/nsdeps with -D ns=<namespace> to
+/// add a missing namespace tag to a module source file.
+///
+
+@has_ns_import@
+declarer name MODULE_IMPORT_NS;
+identifier virtual.ns;
+@@
+MODULE_IMPORT_NS(ns);
+
+// Add missing imports, but only adjacent to a MODULE_LICENSE statement.
+// That ensures we are adding it only to the main module source file.
+@do_import depends on !has_ns_import@
+declarer name MODULE_LICENSE;
+expression license;
+identifier virtual.ns;
+@@
+MODULE_LICENSE(license);
++ MODULE_IMPORT_NS(ns);
diff --git a/scripts/nsdeps b/scripts/nsdeps
new file mode 100644
index 000000000000..148db65a830f
--- /dev/null
+++ b/scripts/nsdeps
@@ -0,0 +1,54 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Linux kernel symbol namespace import generator
+#
+# This script requires at least spatch
+# version 1.0.4.
+SPATCH_REQ_VERSION="1.0.4"
+
+DIR="$(dirname $(readlink -f $0))/.."
+SPATCH="`which ${SPATCH:=spatch}`"
+if [ ! -x "$SPATCH" ]; then
+    echo 'spatch is part of the Coccinelle project and is available at http://coccinelle.lip6.fr/'
+    exit 1
+fi
+
+SPATCH_REQ_VERSION_NUM=$(echo $SPATCH_REQ_VERSION | ${DIR}/scripts/ld-version.sh)
+SPATCH_VERSION=$($SPATCH --version | head -1 | awk '{print $3}')
+SPATCH_VERSION_NUM=$(echo $SPATCH_VERSION | ${DIR}/scripts/ld-version.sh)
+
+if [ "$SPATCH_VERSION_NUM" -lt "$SPATCH_REQ_VERSION_NUM" ] ; then
+    echo 'spatch needs to be version 1.06 or higher'
+    exit 1
+fi
+
+generate_deps_for_ns() {
+    $SPATCH --very-quiet --in-place --sp-file \
+	    $srctree/scripts/coccinelle/misc/add_namespace.cocci -D ns=$1 $2
+}
+
+generate_deps() {
+    local mod_file=`echo $@ | sed -e 's/\.ns_deps/\.mod/'`
+    local mod_name=`cat $mod_file | sed -n 1p | sed -e 's/\/[^.]*$//'`
+    local mod_source_files=`cat $mod_file | sed -n 2p | sed -e 's/\.o/\.c/g'`
+    for ns in `cat $@`; do
+	echo "Adding namespace $ns to module $mod_name (if needed)."
+        generate_deps_for_ns $ns $mod_source_files
+	# sort the imports
+        for source_file in $mod_source_files; do
+            sed '/MODULE_IMPORT_NS/Q' $source_file > ${source_file}.tmp
+            offset=$(wc -l ${source_file}.tmp | awk '{print $1;}')
+            cat $source_file | grep MODULE_IMPORT_NS | sort -u >> ${source_file}.tmp
+            tail -n +$((offset +1)) ${source_file} | grep -v MODULE_IMPORT_NS >> ${source_file}.tmp
+            if ! diff -q ${source_file} ${source_file}.tmp; then
+                mv ${source_file}.tmp ${source_file}
+            else
+                rm ${source_file}.tmp
+            fi
+        done
+    done
+}
+
+for f in `find $srctree/.tmp_versions/ -name *.ns_deps`; do
+    generate_deps $f
+done
-- 
2.23.0.rc1.153.gdeed80330f-goog

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
