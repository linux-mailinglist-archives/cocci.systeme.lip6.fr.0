Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1374C1B709E
	for <lists+cocci@lfdr.de>; Fri, 24 Apr 2020 11:20:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03O9K0uS010101;
	Fri, 24 Apr 2020 11:20:00 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1F8667815;
	Fri, 24 Apr 2020 11:20:00 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D0C057815
 for <cocci@systeme.lip6.fr>; Fri, 24 Apr 2020 11:19:58 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:543])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03O9JvSf017647
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 24 Apr 2020 11:19:58 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id d17so4382754pgo.0
 for <cocci@systeme.lip6.fr>; Fri, 24 Apr 2020 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4XE5uPcNgqgWnR2Cr0pQe97/Ns3BG8LcPaOZ3ZDM6I=;
 b=E7jq44I/8LQbSbFh4C7amXREHt9vpbDMy4Mp6Rh2tJOWIhJ3cK5V+mF7TUqUw/NBEo
 CQzU2eeBAD5rC/FH/8UmxLbD6G0NejF/GqmqYfe5O6LtdG0sZohNskc/zHLSjBFjP+7e
 orIi06XeMWoWo57EyIB1vVicwg3DQQLU66F1vzNCP6GGQoKaffmfEyJHa4PqTJ5AgDXH
 AC23T/tneADvgxBEGfVskPYiaSSjnYUVuoKYBULoSuOu06LgsyORlP5G51aSEJOG74Qg
 YdJeaHBGtJ+HK1xCKytvpJ0INOH82Zj5o0jx3QDLdlhTD/hC2zEawXOiPZzYXOiftLwH
 I3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4XE5uPcNgqgWnR2Cr0pQe97/Ns3BG8LcPaOZ3ZDM6I=;
 b=qGiw+ECDQa5OCcGSVgKDWRQpE89A6rhmKcV5Pz/Jd8jrdre3HzDLQH2y2dcIENg1VJ
 MD/b3JaTjSe4qsIsWR+alXEjC2wpzBg06PbiAtSJ0LsfPwOi0f9cxqN7MdYmDfe33pa8
 yYF/lDWn0nT45rYQCj1RJcZ/hf4OLyOFWDkbrFkDSzq8yqyJqQtXPX2IrNpvBq4hGxnq
 relrZfjG0nAY9clSxWV9tseQj+Yn3Ce3/tAoHPM5kDGzqI9UOvePbiFzv4T9zW63Wd4c
 Iu7wpBk/hznW3uwEsd2NGL/5WXRJryTlL6yavKDYbro1hTxwE8a/ErkNixy37029yWLY
 tLfg==
X-Gm-Message-State: AGi0PuaOmkGs25IR7mvk5RLu/Y4ryiPOFFmtrmXdWnqXntDlCUYGQ1BV
 zvY7xBkjdia2RCNZ5QTvUGdFLL+KtmI=
X-Google-Smtp-Source: APiQypJ19ZQEx+K1b1G/arEzOTllLH0p+gCjdbaKR6Zi+rUhdEfHFlovQlPYuC19BD3y36lYZSZQdA==
X-Received: by 2002:a63:8ac3:: with SMTP id y186mr7836836pgd.277.1587719996337; 
 Fri, 24 Apr 2020 02:19:56 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:55 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:59 +0530
Message-Id: <20200424091801.13871-24-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 24 Apr 2020 11:20:00 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 24 Apr 2020 11:19:58 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [RFC PATCH 23/25] parsing_c: type_c: Add parameter
	attributes to record
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

Paramter attributes are added to the C AST. Reflect this change in a
case in type_c.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/type_c.ml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/parsing_c/type_c.ml b/parsing_c/type_c.ml
index 4a85b683..617b6fc6 100644
--- a/parsing_c/type_c.ml
+++ b/parsing_c/type_c.ml
@@ -304,6 +304,7 @@ let (fake_function_type:
                 { Ast_c.p_namei = None;
                   p_register = false, Ast_c.noii;
                   p_type = ft;
+                  p_attr = [];
                 }
               in
               Some (paramtype, ii)
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
