Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B552CD48C7
	for <lists+cocci@lfdr.de>; Fri, 11 Oct 2019 21:59:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9BJxKuQ002292;
	Fri, 11 Oct 2019 21:59:20 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 53EFA77C0;
	Fri, 11 Oct 2019 21:59:20 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 869F377AE
 for <cocci@systeme.lip6.fr>; Fri, 11 Oct 2019 09:42:22 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9B7gLb5023357
 for <cocci@systeme.lip6.fr>; Fri, 11 Oct 2019 09:42:22 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3FB79B02C
 for <cocci@systeme.lip6.fr>; Fri, 11 Oct 2019 07:42:21 +0000 (UTC)
To: cocci@systeme.lip6.fr
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <56e7bd73-5b50-ddeb-9a56-62daf93eb015@suse.com>
Date: Fri, 11 Oct 2019 09:42:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 11 Oct 2019 21:59:22 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 11 Oct 2019 09:42:22 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Fri, 11 Oct 2019 21:59:18 +0200
Subject: [Cocci] macro parameters and expressions?
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Hi,

I have a simple semantic patch:

   virtual patch

   @@
   expression buf, val;
   @@
   - snprintf(buf, PAGE_SIZE, "%d\n", val)
   + spgprintf_d(buf, val)

This works nearly always as expected, but not in some macros. The cases
where it is not working are those when "val" is using a parameter of the
macro, e.g.:

   #define MACRO(name)    snprintf(pg, PAGE_SIZE, %u\n", ptr->name)

Is that on purpose? If yes, how can this be avoided?


Juergen
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
