Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 043F91E60B3
	for <lists+cocci@lfdr.de>; Thu, 28 May 2020 14:26:15 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04SCPJFd029711;
	Thu, 28 May 2020 14:25:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 53E7C7829;
	Thu, 28 May 2020 14:25:19 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8B61D3E1D
 for <cocci@systeme.lip6.fr>; Thu, 28 May 2020 14:25:17 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:444])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04SCPFDc025762
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 28 May 2020 14:25:16 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id q8so13485747pfu.5
 for <cocci@systeme.lip6.fr>; Thu, 28 May 2020 05:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3748bMb8wprhoaT4SC5oNS1sbGT16s0G+sDOhzklplI=;
 b=b+T4DzknHxsq5glHrADuXz4A6orhDrYVB/wdMalfj4+PNaqAmEDPWdvaxWmQEqEkKp
 uTO5S1yfmQzpSLC/DbxYT1u4jUE4oDjbzQY+vNfWshEJDQBQ9CbmkOVaxhV8NyKaGQao
 dZNIxG43ApPjuBXw31c9zfdEHHH3l1ChB5sRDmRQ8omjA0B1xL5xASYorrqWO01Y2tal
 CCbYY262kvk68Yj0H0Q18W9slO3bXJGb26t0Vz6lJR6Sfj5hdD1w0PdwQpaJdFZQ9v+c
 R+Rslgltd9If5HsceuJqglR2gFa5H83XekwbnpaNK7Ol1WpXRNcEvTkV66G+9osDE7nv
 EWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3748bMb8wprhoaT4SC5oNS1sbGT16s0G+sDOhzklplI=;
 b=bJ4VRHmJmdiU5j0OtHYqqAPmF1J8O7FGK8vLd7dOiwgnkjqie8WS30lMokxFLAzQhD
 eqZvyzAxvdf9RlNVzr9D3/CpHITsHXwviAg8uJc/2Au9qu0J1CDiXdFXw2/nGjI5UwYJ
 cLCQCImVfLubNLwiqyhB14Vd4Vtr2hgBpdoOolWoY4vZ5aBwDxP4IPKlYGR8L7fWp37x
 8jlbWPrcbAKiwWTNhCpfFwg4gY0pxzUb0hJ66CGnO8hyNNg+S6wUhA5HnTXVLupZxRor
 HqCZmhyYBA0FdBkVXteJNsVZDQrurQyH6hsTttpXK/Y8WgtIOYn/SlNdrKhMlqsMZZAb
 uNZQ==
X-Gm-Message-State: AOAM532uSVt5Hs88UrMCRJGFnr5jDsLEybmt2bns1qJq4/eIA+wMsGm6
 TSnaaBUh+FCaGCP5HCEqnhBJ5kjO
X-Google-Smtp-Source: ABdhPJw3r92akPiHQMim61b44vO4FwftvklG9wT5ULxZoJJ9lHEZdAKW/XacvRWHldh5JeOmI6tQ1g==
X-Received: by 2002:aa7:9d8c:: with SMTP id f12mr2862395pfq.224.1590668715184; 
 Thu, 28 May 2020 05:25:15 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:14 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:12 +0530
Message-Id: <20200528122428.4212-11-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 28 May 2020 14:25:19 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 28 May 2020 14:25:17 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v2 10/25] parsing_c: parser: Add MacroDecl end
	attributes production
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

Add a production for macro declaration end attributes. This parses the
following C code from Linux v5.6-rc7:

  arch/x86/kernel/nmi_selftest.c:

	static DECLARE_BITMAP(nmi_ipi_mask, NR_CPUS) __initdata;

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 684ee63e..d36ac2a6 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1597,6 +1597,17 @@ decl2:
 	   MacroDecl
 	     ((NoSto, fst $2, $4, true), [snd $2;$3;$5;$6;fakeInfo()]) }
 
+ | storage_const_opt TMacroDecl TOPar argument_list TCPar end_attributes
+   TPtVirg
+     { function _ ->
+       match $1 with
+	 Some (sto,stoii) ->
+	   MacroDecl
+	     ((sto, fst $2, $4, true), (snd $2::$3::$5::$7::fakeInfo()::stoii))
+       | None ->
+	   MacroDecl
+	     ((NoSto, fst $2, $4, true), [snd $2;$3;$5;$7;fakeInfo()]) }
+
  | storage_const_opt
      TMacroDecl TOPar argument_list TCPar teq initialize TPtVirg
      { function _ ->
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
