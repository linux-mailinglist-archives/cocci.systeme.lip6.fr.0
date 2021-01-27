Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 310F7306504
	for <lists+cocci@lfdr.de>; Wed, 27 Jan 2021 21:24:02 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10RKNUBO003325;
	Wed, 27 Jan 2021 21:23:31 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D4CCD77BF;
	Wed, 27 Jan 2021 21:23:30 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 91238389B
 for <cocci@systeme.lip6.fr>; Wed, 27 Jan 2021 21:23:28 +0100 (CET)
Received: from mail.schemamania.org (rrcs-50-75-19-234.nys.biz.rr.com
 [50.75.19.234])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10RKNQ9S016616
 for <cocci@systeme.lip6.fr>; Wed, 27 Jan 2021 21:23:27 +0100 (CET)
Received: from oak.schemamania.org (localhost [IPv6:::1])
 by mail.schemamania.org (Postfix) with ESMTP id D99C0256FABD
 for <cocci@systeme.lip6.fr>; Wed, 27 Jan 2021 15:23:25 -0500 (EST)
Date: Wed, 27 Jan 2021 15:23:25 -0500
From: "James K. Lowden" <jklowden@schemamania.org>
To: cocci@systeme.lip6.fr
Message-Id: <20210127152325.5692b2e6eb7b8ed82d91262b@schemamania.org>
X-Mailer: Sylpheed 3.4.3 (GTK+ 2.24.28; x86_64--netbsd)
Mime-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 27 Jan 2021 21:23:33 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 27 Jan 2021 21:23:27 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] qualified function rule
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

I don't understand how, if it's possible, to qualify a function in a
rule.  I want the class of all functions having a parameter of a
particular type. 

The code I'm working with has hundreds of unnecessary casts.  Many
functions take a void* parameter, but are nonetheless called by casting
the parameter.  For example, the parameters to memcpy(3) often
have casts applied.  

I imagine writing a rule like

@@
type T, D;
identifier F(void*);
identifier D * data;
@@

- F((T*)data)
+ F(data)

but that doesn't work, and I haven't found anything that does.  

In the kmalloc examples, I see things like 

- \(kmalloc|kcmalloc\)(...)
+ mumble something

but that forces me to enumerate all such function names. It seems
vaguely like positions would do the trick, but, well, vaguely.  

Is there a way?  

--jkl
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
