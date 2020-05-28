Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9785C1E60B1
	for <lists+cocci@lfdr.de>; Thu, 28 May 2020 14:26:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04SCPADP012248;
	Thu, 28 May 2020 14:25:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 054537829;
	Thu, 28 May 2020 14:25:10 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C0CBB3E1D
 for <cocci@systeme.lip6.fr>; Thu, 28 May 2020 14:25:07 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:443])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04SCP6QL011125
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 28 May 2020 14:25:07 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id f3so637137pfd.11
 for <cocci@systeme.lip6.fr>; Thu, 28 May 2020 05:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1olmncHDezAvcs6va6oeT71AAyzZ/24HM2cRbu3b/54=;
 b=u16QaWmrzMPNhHwV+0NxnzJ34nNSmFJd90eDNAq96A/XNDtYKX8r75nJJ5A1p+9OnL
 F92QJ8lJG78/DFhtBW/FSKF1JvK+23wCSty1OnZ/9LCj/KZOTvtnbjS0E16T/67rlTDV
 4JIgqziVCQ83j6ptNvftREKd1Wu4YPocPoQcWbZ0hrwZV+E/QTBDdFq7NR8Nal3Kv3ic
 tMSP96r88/AQAFrJQuc8ffc0ELOmYMOlmOa7zxXJ9LMt+z+IhU8xrHvQrUznjfMil+3g
 uPwR9ReQZb+pVjlD0llpmgnbIRG6vcHPl/hEsnkurJojBort4k4shGzHnew5v1OXR+Vm
 nA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1olmncHDezAvcs6va6oeT71AAyzZ/24HM2cRbu3b/54=;
 b=MnO5H9TnABngCJHiz7OU/vSFJEF5DjaYcASkM33r2wHuo5M0UOCHW62+DBaoh7KTfB
 u8KYt2u4pk9PKuxIc/4wYBSopa0vLJyhwaEEyZiUQx2KgprIaZ6q/+YOmeaImR75ufdt
 vkdfGke5Lbr9W4XcAv66bz0hOAEaAYTW7Fun9aUCuh1IQqKhs1PCiqsPJhHNosM9xtcm
 MtgBoXFzLKT8F3RUZIgfr89R05BjhKzPYUSgdmMrUZIIEEoWxFvH2j5XWl/Fx866+d7B
 H2TNVNNIkmTbaf/JoJyXoKZibMyg0ks9jIDg9TfKzAGPmFJdpwRglFv3T/COwLG9rM+m
 qeOg==
X-Gm-Message-State: AOAM532egkpX4w8wQ4OM5MEVo3mnEgn7KRwiV/bmbobOrUh0CzAW0OkE
 ewpa568cxWHbUEmmsVezDmOmPcCO
X-Google-Smtp-Source: ABdhPJy/6CLqb7jGcL9GTHwXFuDXDmX/lWVGPwi279GU31eoNvzrstXkr7cnRSHxlSKVu9ePIP4WLQ==
X-Received: by 2002:a63:1c55:: with SMTP id c21mr2672509pgm.328.1590668705233; 
 Thu, 28 May 2020 05:25:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:04 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:09 +0530
Message-Id: <20200528122428.4212-8-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 28 May 2020 14:25:10 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 28 May 2020 14:25:07 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v2 07/25] parsing_c: parser: Add
	init_declarator_attrs rule
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

As per GCC's C grammar, the init-declarator rule has the following
production:

	init-declarator:
	  declarator simple-asm-expr[opt] gnu-attributes[opt]
	  declarator simple-asm-expr[opt] gnu-attributes[opt] = initializer

Due to conflicts in Coccinelle's C grammar, adding productions with
attributes to init_declarator is not possible. Create
init_declarator_attrs and use this rule in init_declarator_list for
handling attributes after commas.

Following is an example of C code that is parsed successfully:

	struct mxser_mstatus ms, __user *msu = argp;

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index be3fdbab..498def13 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1667,6 +1667,23 @@ init_declarator2:
  | declaratori TOParCplusplusInit argument_list TCPar
      { ($1, ConstrInit($3,[$2;$4])) }
 
+/*(*-----------------------------------------------------------------------*)*/
+/*(* declarators (right part of type and variable). *)*/
+/*(* This is a workaround for the following case: *)*/
+/*(* <type> <declarator>, <attribute> <declarator> ...*)*/
+/*(* The normal init_declarator rule does not handle this, and adding *)*/
+/*(* attributes to it causes conflicts, thus the need for this rule. *)*/
+/*(*-----------------------------------------------------------------------*)*/
+init_declarator_attrs2:
+ | declaratori                  { ($1, NoInit) }
+ | attributes declaratori       { ($2, NoInit) }
+ | declaratori teq initialize   { ($1, ValInit($2, $3)) }
+ | attributes declaratori teq initialize   { ($2, ValInit($3, $4)) }
+ /* C++ only */
+ | declaratori TOParCplusplusInit argument_list TCPar
+     { ($1, ConstrInit($3,[$2;$4])) }
+ | attributes declaratori TOParCplusplusInit argument_list TCPar
+     { ($2, ConstrInit($4,[$3;$5])) }
 
 /*(*----------------------------*)*/
 /*(* workarounds *)*/
@@ -1675,6 +1692,8 @@ teq: TEq  { et "teq" (); $1 }
 
 init_declarator: init_declarator2  { dt "init" (); $1 }
 
+init_declarator_attrs: init_declarator_attrs2 { dt "init_attrs" (); $1 }
+
 
 /*(*----------------------------*)*/
 /*(* gccext: *)*/
@@ -2372,9 +2391,9 @@ enumerator_list:
 
 init_declarator_list:
  | init_declarator                             { [$1,   []] }
- | init_declarator_list TComma cpp_directive_list init_declarator
+ | init_declarator_list TComma cpp_directive_list init_declarator_attrs
      { $1 @ [$4, [$2]] }
- | init_declarator_list TComma init_declarator { $1 @ [$3,     [$2]] }
+ | init_declarator_list TComma init_declarator_attrs { $1 @ [$3,     [$2]] }
 
 
 parameter_list:
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
