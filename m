Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA74291FC8
	for <lists+cocci@lfdr.de>; Sun, 18 Oct 2020 22:19:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09IKJakh006918;
	Sun, 18 Oct 2020 22:19:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 04A5F77BF;
	Sun, 18 Oct 2020 22:19:36 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B6E7474CE
 for <cocci@systeme.lip6.fr>; Sun, 18 Oct 2020 22:19:33 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0064.hostedemail.com
 [216.40.44.64])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTPS id 09IKJV4u016555
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Sun, 18 Oct 2020 22:19:32 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 72D0A181CAC76
 for <cocci@systeme.lip6.fr>; Sun, 18 Oct 2020 20:19:30 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 2A1F212D5;
 Sun, 18 Oct 2020 20:19:27 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3871:3872:4321:5007:9040:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13069:13311:13357:13439:14659:21080:21627:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: test32_5216ff127231
X-Filterd-Recvd-Size: 1529
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Sun, 18 Oct 2020 20:19:26 +0000 (UTC)
Message-ID: <49c87dede8d06ba90ecb3200b2a773860d61a3c8.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Tom Rix <trix@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Sun, 18 Oct 2020 13:19:24 -0700
In-Reply-To: <a15ada1f-9bad-612e-e841-934bff088f38@redhat.com>
References: <20201017160928.12698-1-trix@redhat.com>
 <f530b7aeecbbf9654b4540cfa20023a4c2a11889.camel@perches.com>
 <alpine.DEB.2.22.394.2010172016370.9440@hadrien>
 <dfe24da760056e31d90ff639b47c494263b5f4a7.camel@perches.com>
 <a15ada1f-9bad-612e-e841-934bff088f38@redhat.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 18 Oct 2020 22:19:36 +0200 (CEST)
X-Greylist: Delayed for 18:13:34 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Sun, 18 Oct 2020 22:19:32 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: linux-kernel@vger.kernel.org, cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH] checkpatch: Allow --fix removal of unnecessary
 break statements
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

On Sun, 2020-10-18 at 13:07 -0700, Tom Rix wrote:
> I like!
[]
> could add a '|break' here to catch the couple
[]
> break;
> 
> break;

Unfortunately, checkpatch is really stupid and it
wouldn't catch those
cases as there are blank lines
between the existing consecutive break
statements.

It would catch

	break;
	break;

but there aren't any of those so it seems unlikely
to be a very useful addition.


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
