Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5101E00F3
	for <lists+cocci@lfdr.de>; Sun, 24 May 2020 19:21:30 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04OHKpkD028518;
	Sun, 24 May 2020 19:20:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id BD3973D0F;
	Sun, 24 May 2020 19:20:51 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 373403D0F
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 19:20:50 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:644])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04OHKmLj007803
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 19:20:49 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id x18so5512507pll.6
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 10:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6F6rYkGbd5gKP/YW9Kz6OsC3DBOLToAwvvAp4zr2wk=;
 b=tpq4UsRZrmDb+9NUQKCDNER9luxR8f4W8vM0d6NCqUD3Lxy8F3zuJTkTGUIdwmJhq3
 ff3rrwxcBE3sSF/uzAdkkkRW6VrXSZO2G0nZ+6JeObA3XbbLffne2Fs7HZMm49f6ebgS
 pF37XEI0wRs0NHA9xVSnEUH6QFoEIutCQeMFfgXzuFQMfwi7kvnl7FuCg/onEnVq6mVu
 86kxly4Qr1g27NPY8gyoknwlldGUq6TaQySNf0F1Ov3alvdrqmYiWZU81ZG55mPeJSRQ
 d3juCYLtBmoHNSWsPg37GDGP6uPmf15nQF3hD6Iwy72t/d55ZDJNXG/ujzDihQC1ir/f
 EPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6F6rYkGbd5gKP/YW9Kz6OsC3DBOLToAwvvAp4zr2wk=;
 b=U50Pc3DimsneeS1PljFd5E0b+zXWdAILxD7w4IskrZituFUVSbTKz1EMD/fllLsXip
 Q0bCylytzro3mv+MzmaF/3dXivb3hFPN66P7hmwdvQf+IrNJs3bN8ACLKeq0PwwdQ0cP
 W9bQ5M6/EHDahff3Rjl+Jw/8tzlRW8Q/VVh4QymB/tfv8wiUdUHl8flTjkiD8KsllDkv
 QtXfPKkkzAdxYT+PGK0MWXGCAVHE9y2fPB1SLIUd/5x/0AwpvIxSwKN3q03DBktk9jSA
 QHoKoXecHtMfKZ+95W5k2w+4vym5EgSl7F9RJXZpy3u47X9YylTPVq4mHiunTTwbm2ax
 pbNg==
X-Gm-Message-State: AOAM530SCqtIAT7aS1UbxhUd9S50411m2RDH+pp8vtsllOF3GuRSJyly
 4tp4BtWtLkz0sn0lvmH0a3WzK0MWxpU=
X-Google-Smtp-Source: ABdhPJwnuIgtN0CugFlKnm3rlEspHIvUF/eJUAIP8dkXSvQmtjyXenvxGln8HNCeRRfeA0+5cR3KLQ==
X-Received: by 2002:a17:902:fe8d:: with SMTP id
 x13mr25026536plm.198.1590340847853; 
 Sun, 24 May 2020 10:20:47 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:20:47 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:14 +0530
Message-Id: <20200524171935.2504-10-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 24 May 2020 19:20:51 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sun, 24 May 2020 19:20:49 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 09/30] parsing_cocci: check_meta: Reflect Macrodecl
	attributes
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

Macrodecl attributes are added to the SmPL AST. Reflect these changes in
check_meta.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/check_meta.ml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/check_meta.ml b/parsing_cocci/check_meta.ml
index 5a348ba3..da159a36 100644
--- a/parsing_cocci/check_meta.ml
+++ b/parsing_cocci/check_meta.ml
@@ -281,7 +281,8 @@ and declaration context old_metas table minus d =
       ident FN old_metas table minus name;
       List.iter (fninfo old_metas table minus) fi;
       parameter_list old_metas table minus params
-  | Ast0.MacroDecl(stg,name,lp,args,rp,sem) ->
+  | Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem) ->
+      (* no meta attribute yet *)
       ident GLOBAL old_metas table minus name;
       dots (expression ID old_metas table minus) args
   | Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
