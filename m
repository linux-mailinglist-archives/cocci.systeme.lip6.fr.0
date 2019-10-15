Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB292D70BC
	for <lists+cocci@lfdr.de>; Tue, 15 Oct 2019 10:07:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9F85Tik019259;
	Tue, 15 Oct 2019 10:05:29 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0455677C3;
	Tue, 15 Oct 2019 10:05:29 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7073B44B2
 for <cocci@systeme.lip6.fr>; Tue, 15 Oct 2019 10:05:27 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9F85Q4k014862
 for <cocci@systeme.lip6.fr>; Tue, 15 Oct 2019 10:05:26 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,298,1566856800"; d="scan'208";a="322729075"
Received: from 81-65-53-202.rev.numericable.fr (HELO hadrien) ([81.65.53.202])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Oct 2019 10:05:26 +0200
Date: Tue, 15 Oct 2019 10:05:26 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <aa8de6c2-7baf-321a-2447-29f6b107eb9c@web.de>
Message-ID: <alpine.DEB.2.21.1910151004110.3774@hadrien>
References: <56e7bd73-5b50-ddeb-9a56-62daf93eb015@suse.com>
 <56102ab5-b633-7e14-1fd3-3f43fb0770b9@web.de>
 <alpine.DEB.2.21.1910141740580.2330@hadrien>
 <aa8de6c2-7baf-321a-2447-29f6b107eb9c@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-87912342-1571126726=:3774"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 15 Oct 2019 10:05:29 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Tue, 15 Oct 2019 10:05:26 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: =?ISO-8859-15?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] macro parameters and expressions?
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-87912342-1571126726=:3774
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 15 Oct 2019, Markus Elfring wrote:

> >> * Fix search for parameterised macros with SmPL
> >>   https://github.com/coccinelle/coccinelle/issues/94
> …
> > There are no #defines in his semantic patch.
>
> This design detail can probably be taken also better into account
> if other software development challenges will finally be solved.
>
> elfring@Sonne:~/Projekte/Coccinelle/Probe> spatch --parse-c Jürgen_Groß-Beispiel1.c
> …
> (ONCE) LEXER:unrecognised symbol, in token rule:\
> LEXER: WIERD end of file in string
> PB: not found closing paren in fuzzy parsing
> …
> BAD:!!!!! #define MACRO(name)    snprintf(pg, PAGE_SIZE, %u\n", ptr->name)

If a " is missing then the code can't be parsed and Coccinelle won't do
anything.  But I don't know if this was a bug in the original code or
something you have modified; you sent another message that did not have
this problem.

> https://wiki.sei.cmu.edu/confluence/display/c/PRE11-C.+Do+not+conclude+macro+definitions+with+a+semicolon
> https://gcc.gnu.org/onlinedocs/cpp/Swallowing-the-Semicolon.html
>
> How will the software situation be improved further?

What software situation?

julia
--8323329-87912342-1571126726=:3774
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-87912342-1571126726=:3774--
