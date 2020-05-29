Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 913311E7CB9
	for <lists+cocci@lfdr.de>; Fri, 29 May 2020 14:10:24 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04TC9nMq005372;
	Fri, 29 May 2020 14:09:49 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id EEBAD5D47;
	Fri, 29 May 2020 14:09:48 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 465E85D47
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:09:47 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:544])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04TC9jXu016422
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:09:46 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id p21so1397541pgm.13
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 05:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4XvaJ298vZx/W88y8LDZtOr/Fhsv+lgsvbh6Tfxa+1A=;
 b=Myy727+OwB7bNIjOKBCoLOa4nHYPUgnNl57kMD9Mcw5l9axulZ4PbCoxv32rDlMN7S
 grpe2h+ITzn9UUGZzn9hznjrjf/WEcA08atWCFBAPbHK7/9mv+QaVnYnMiJwE5ywWOpS
 lwHBz3RWO22eVTtgwWN1rd8h5kaNEGdnQbaHTz21+mrZSEJGAIkGuNMknNdzAsmya8jQ
 sR+NYYRx98lNnlCleCsvF7hP00a/YteftbzTTJpkzvTNIJe09GkOqUqh9hmrZIDjcsdo
 RmSPeB2PFor2OUqvYOPXKAeCNGFLrngXcu8NiPpPOpHZN0/auP84QousO8GgniItZQgj
 IYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4XvaJ298vZx/W88y8LDZtOr/Fhsv+lgsvbh6Tfxa+1A=;
 b=aAPIljTpL3rXGI5HIaOAwuhqGqSH99MQcGHPox/sI77nTL8GtTSYqh/K6G93aVrI4d
 K+FGHi47XXz4QQVyPzKmKlRe30sVfXeZ7Ok/EK3TUfIBpfKrDD6GtKv93nGOoUBtVV1d
 jFOY3jOWKXLA1/7Uf15ADc7H0mV2WdRaCBYLmpRj0CmrQlBknxHS85OblmIpEMb4ga3P
 hL4ocR0lrarmlDUpmLRhnJIJWtwTDRurpIC0YuT6rWIDAqgeniU99sApWmDJE+ybCWGf
 2BD/+I2AoaFaLpQO3uLDUMht4JTs5WGJfbY+7t7XJBWcxLnqtEgQAoNS+irMTZH5GRBe
 cNtA==
X-Gm-Message-State: AOAM532XDb3qSi6NHQL7ZZOtiTIFE8ISdDZqIkYw2O+u4bgVH6r9TpzH
 JLyrT2g02CiMyOsb/urQPlIa3VcH
X-Google-Smtp-Source: ABdhPJwxONddqIsj7Z3VMVU6AztvLxDcK3iKyBx0hXj586jwEYUQhNy7FLnJ5ofvXihuJdSJ2TPz7w==
X-Received: by 2002:a62:ee19:: with SMTP id e25mr8595654pfi.101.1590754184896; 
 Fri, 29 May 2020 05:09:44 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:09:44 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:51 +0530
Message-Id: <20200529120703.31145-22-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 29 May 2020 14:09:49 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 29 May 2020 14:09:46 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v3 21/32] parsing_c: parser: Parse Cast attributes
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

Cast attributes are added to the C AST. Parse cast attributes in the C
parser and place them in the C AST. The attributes are taken from the
type_name rule of the C parser.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 1630ed77..398a6f45 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -818,7 +818,8 @@ arith_expr:
 
 cast_expr:
  | unary_expr                        { $1 }
- | topar2 type_name tcpar2 cast_expr { mk_e(Cast (snd $2, $4)) [$1;$3] }
+ | topar2 type_name tcpar2 cast_expr
+   { mk_e(Cast (snd $2, fst $2, $4)) [$1;$3] }
 /*
 It could be useful to have the following, but there is no place for the
 attribute in the AST.
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
