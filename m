Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B1E2D157
	for <lists+cocci@lfdr.de>; Wed, 29 May 2019 00:07:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4SM61R0020910;
	Wed, 29 May 2019 00:06:01 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C0F26776A;
	Wed, 29 May 2019 00:06:01 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9C6DF774E
 for <cocci@systeme.lip6.fr>; Wed, 29 May 2019 00:05:59 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4SM5w5c001958
 for <cocci@systeme.lip6.fr>; Wed, 29 May 2019 00:05:59 +0200 (CEST)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DC3D2075C
 for <cocci@systeme.lip6.fr>; Tue, 28 May 2019 22:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559081157;
 bh=qlrfAr72jMa4pDAvCunDbCRYwXYkGAs0wQuBy+5MiEs=;
 h=From:Date:Subject:To:From;
 b=nY4FRt8R435e+HwjIv9F3zLQyOCnrg6QoWrsGSVxbaTXRVTokB4+jeO9HtpLh9xza
 haKDY2AfvVNufwjkIob7cD7mvV/+kTCuSo/zqRz7NOoztDP7P8KF299rRSlzQZmVFX
 PUr0ugNKe9jj+sUPe61zlswaEOdiOEH8F9ZWL7kE=
Received: by mail-oi1-f170.google.com with SMTP id r136so366642oie.7
 for <cocci@systeme.lip6.fr>; Tue, 28 May 2019 15:05:57 -0700 (PDT)
X-Gm-Message-State: APjAAAVFYr364JdsdjjlKIGFtpa66MjghDQaN5Ify0zCg+PERWbwLi20
 WN8xeV8WuHex8oCX4Sls8Cqeb/8yP20DmQEpeC0=
X-Google-Smtp-Source: APXvYqxtjNubMg2UCgV2fuzfpQzcpd9J21v5RNgEtjJwBeH3EOwE10+TWwxw+82wNGGuKq4QmPknDU2TI7zXVpbbq+w=
X-Received: by 2002:aca:3208:: with SMTP id y8mr4009371oiy.108.1559081156859; 
 Tue, 28 May 2019 15:05:56 -0700 (PDT)
MIME-Version: 1.0
From: Timur Tabi <timur@kernel.org>
Date: Tue, 28 May 2019 17:05:20 -0500
X-Gmail-Original-Message-ID: <CAOZdJXVuNYEkFOiUWYq0GbqRUfuTNV35FGt7EViSSq6AqAY2-A@mail.gmail.com>
Message-ID: <CAOZdJXVuNYEkFOiUWYq0GbqRUfuTNV35FGt7EViSSq6AqAY2-A@mail.gmail.com>
To: cocci <cocci@systeme.lip6.fr>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 29 May 2019 00:06:04 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 29 May 2019 00:05:59 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] Controlling where braces are located?
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

I'm using coccinelle on some C source code that does not follow Linux
kernel coding conventions.  In particular, the first left brace is on
its own line:

if (x == 0)
{
   // ...
}

I have this rule, but spatch puts the left brace on the same line as
if-statement:

 x = BOARDOBJGRP_OBJ_GET(...);
+if (x == NULL)
+{
+    status = ERROR;
+    goto label;
+}

This results in:

+                if (p == NULL) {
+                    status = ERROR;
+                    goto func_exit;
+                }

How can I fix this?
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
