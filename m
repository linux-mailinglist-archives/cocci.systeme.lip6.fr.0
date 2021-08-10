Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A30143DDFFE
	for <lists+cocci@lfdr.de>; Mon,  2 Aug 2021 21:26:42 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 172JQCNb027246;
	Mon, 2 Aug 2021 21:26:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8663E7783;
	Mon,  2 Aug 2021 21:26:12 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 29FCC3783
 for <cocci@systeme.lip6.fr>; Mon,  2 Aug 2021 21:26:10 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0022.hostedemail.com
 [216.40.44.22])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 172JQ5nj001594
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Mon, 2 Aug 2021 21:26:06 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 88DA31802CCCE
 for <cocci@systeme.lip6.fr>; Mon,  2 Aug 2021 17:00:32 +0000 (UTC)
Received: from omf06.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 7D75A100E7B52;
 Mon,  2 Aug 2021 17:00:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf06.hostedemail.com (Postfix) with ESMTPA id E4E662448B4; 
 Mon,  2 Aug 2021 17:00:27 +0000 (UTC)
Message-ID: <ab04588b3b0c2bfa6942beb9069754ce59f2551b.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: cocci <cocci@systeme.lip6.fr>
Date: Mon, 02 Aug 2021 10:00:26 -0700
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: E4E662448B4
X-Spam-Status: No, score=-1.22
X-Stat-Signature: 9tg1wmtu85gepmmdjsof9ep84mkt6ko6
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+nPFRaiLS2JvfQ+2Jz3V+1x5/vRhiJLWA=
X-HE-Tag: 1627923627-81141
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 02 Aug 2021 21:26:16 +0200 (CEST)
X-Greylist: Delayed for 01:42:04 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Mon, 02 Aug 2021 21:26:06 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] Coccinelle: Length/Size of char array?
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

Is it possible to determine the length of a matched char array and use
the length in a test?

For instance, add something like a test to show only the instances
where a src buffer overruns a dest buffer.

void foo(void)
{
	char foo[5];

	strcpy(foo, "fits");
}

it would be useful to see only the instances where the dest
buffer would be overrun like:

void foo(void)
{
	char foo[5];

	strcpy(foo, "doesn't fit");
}

---

This would find all instances of a constant src array into non-pointer dst:

@@
char [] dest;
constant char [] src;
@@

*	strcpy(dest, src)

---

Is there a mexhanism like:

@@
char [] dest;
constant char [] src;
@@

	when (some cocci grammar testing length(dest) < length(src))
*	strcpy(dest, src)


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
